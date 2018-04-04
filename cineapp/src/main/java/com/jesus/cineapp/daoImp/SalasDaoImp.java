/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.daoImp;

import com.jesus.cineapp.dao.SalasDao;
import com.jesus.cineapp.hibernate.HibernateUtil;
import com.jesus.cineapp.pojos.Salas;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author negocios_digitales
 */
@Repository
public class SalasDaoImp implements SalasDao{
    
    private static SessionFactory sessionFactory;
    private Session session;
    
    public SalasDaoImp(){
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public void abrirSesion(){
        session = sessionFactory.openSession();
    }
    
    public void cerrarSesion(){
        session.close();
    }
    
    @Override
    public List<Salas> obtenerSalas(){
        abrirSesion();
        List<Salas> salas = session.createQuery("from Salas").list();
        cerrarSesion();
        
        return salas;
    }
}
