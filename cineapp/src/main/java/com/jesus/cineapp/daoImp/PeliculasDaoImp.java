/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.daoImp;

import com.jesus.cineapp.dao.PeliculasDao;
import com.jesus.cineapp.hibernate.HibernateUtil;
import com.jesus.cineapp.pojos.Peliculas;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author negocios_digitales
 */
@Repository
public class PeliculasDaoImp implements PeliculasDao{

    private static SessionFactory sessionFactory;
    private Session session;
    
    public PeliculasDaoImp(){
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
    public List<Peliculas> listaPeliculas(){
        
        abrirSesion();
        List<Peliculas> peliculas = session.createQuery("from Peliculas").list();
        cerrarSesion();
        
        return peliculas;
    }
    
    @Override
    public Peliculas obtenerPeliculaById(BigDecimal idPelicula){
        try {
            abrirSesion();
        
            Peliculas pelicula = (Peliculas) session.createQuery(
                    "from Peliculas p where p.idPelicula = :idpelicula")
                    .setParameter("idpelicula", idPelicula)
                    .uniqueResult();
        
            return pelicula;
        } catch (HibernateException e) {
            System.out.println("Exception:::.. " + e);
            cerrarSesion();
            return null;
        } finally{
            cerrarSesion();
        }
    }
}
