/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.daoImp;

import com.jesus.cineapp.dao.HorariosDao;
import com.jesus.cineapp.dao.PeliculasDao;
import com.jesus.cineapp.hibernate.HibernateUtil;
import com.jesus.cineapp.model.Horario;
import com.jesus.cineapp.model.VHorariosPeliculas;
import com.jesus.cineapp.pojos.Horarios;
import com.jesus.cineapp.pojos.RelPeliculasHorarios;
import com.jesus.cineapp.pojos.Salas;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author negocios_digitales
 */
@Repository
public class HorariosDaoImp implements HorariosDao{
    
    @Autowired
    private PeliculasDao peliculasDao;
    
    private static SessionFactory sessionFactory;
    private Session session;
    
    public HorariosDaoImp(){
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public void abrirSesion(){
        session = sessionFactory.openSession();
        session.getTransaction().begin();
    }
    
    public void cerrarSesion(){
        session.getTransaction().commit();
        session.close();
    }
    
    @Override
    public Boolean guardarHorario(Horario horario){
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
        try {
            Date date = formatter.parse(horario.getFecha());
            
            abrirSesion();
            
            Salas sala =  (Salas) session.createQuery("from Salas s where s.idSala = :idSala")
                    .setParameter("idSala", horario.getIdSala())
                    .uniqueResult();
            
            Horarios horarios = new Horarios();
            horarios.setSalas(sala);
            horarios.setFecha(date);
            horarios.setHora(horario.getHora());
            
            session.save(horarios);
            
            return true;
            
        } catch (Exception e) {
            System.out.println("Exception:::.. " + e);
            cerrarSesion();
            return false;
        } finally{
            cerrarSesion();
        }
    }
    
    @Override
    public List<VHorariosPeliculas> obtenerHorarios(){
        List<VHorariosPeliculas> horarioPelicula = null;
        abrirSesion();
        //List<Horarios> horarios = session.createQuery("from Horarios").list();
        
        Query q = session.createSQLQuery("select " +
            "d.titulo, b.fecha, b.hora, a.nombre_sala, a.precio, b.id_horario " +
            "from REL_PELICULAS_HORARIOS c " +
            "inner join PELICULAS d on d.ID_PELICULA = c.ID_PELICULA " +
            "inner join HORARIOS b on b.ID_HORARIO = c.ID_HORARIO " +
            "inner join SALAS a on b.ID_SALA = a.ID_SALA");
        
        List list = q.list();
        if (list != null && !list.isEmpty()) {
                horarioPelicula = new ArrayList();
                for (Iterator<Object[]> it = list.iterator(); it.hasNext();) {
                    Object[] obj = it.next();
                    VHorariosPeliculas horarioP = new VHorariosPeliculas();
                   // horarioP.setNo(obj[0] != null ? BigDecimal.valueOf(Long.valueOf(obj[0].toString())) : null);
                    horarioP.setTitulo(obj[0] != null ? obj[0].toString() : "");
                    horarioP.setFecha(obj[1] != null ? (Date) obj[1] : null);
                    horarioP.setHora(obj[2].toString());
                    horarioP.setNombreSala(obj[3].toString());
                    BigDecimal prueba = (BigDecimal) obj[4];
                    horarioP.setPrecio(prueba.floatValue());
                    horarioP.setId(obj[5] != null ? BigDecimal.valueOf(Long.valueOf(obj[5].toString())) : null);
                    horarioPelicula.add(horarioP);
                }
            }
        
        
        cerrarSesion();
        
        return horarioPelicula;
    }
    
    @Override
    public void guardaRelacionHoraPelicula(BigDecimal idPelicula){
        try {
            abrirSesion();
            Horarios horarios = (Horarios) session.createQuery
                    ("FROM Horarios h where rownum = 1 ORDER BY h.idHorario desc")
                    .uniqueResult();
            
            RelPeliculasHorarios relPeliculasHorarios = new RelPeliculasHorarios();
            relPeliculasHorarios.setHorarios(horarios);
            relPeliculasHorarios.setPeliculas(peliculasDao.obtenerPeliculaById(idPelicula));
            
            session.save(relPeliculasHorarios);
            
        } catch (HibernateException e) {
            System.out.println("Exception:::.. " + e);
            cerrarSesion();
        } finally{
            cerrarSesion();
        }
        
    }
    
    @Override
    public Boolean eliminarHorario(BigDecimal id){
        try {
            abrirSesion();
            Horarios horarios = (Horarios) session.createQuery
                    ("FROM Horarios h where h.idHorario = :idHorario")
                    .setParameter("idHorario", id)
                    .uniqueResult();

            session.delete(horarios);
            return true;
        } catch (HibernateException e) {
            System.out.println("Exception:::.. " + e);
            cerrarSesion();
            return false;
        } finally{
            cerrarSesion();
        }

    }
}
