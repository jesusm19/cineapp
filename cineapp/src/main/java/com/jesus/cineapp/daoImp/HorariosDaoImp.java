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
import com.jesus.cineapp.pojos.Horarios;
import com.jesus.cineapp.pojos.RelPeliculasHorarios;
import com.jesus.cineapp.pojos.Salas;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
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
    public List<Horarios> obtenerHorarios(){
        abrirSesion();
        List<Horarios> horarios = session.createQuery("from Horarios").list();
        cerrarSesion();
        
        return horarios;
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
}
