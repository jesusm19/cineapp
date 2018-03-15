/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.daoImp;

import com.jesus.cineapp.dao.PeliculasDao;
import com.jesus.cineapp.hibernate.HibernateUtil;
import com.jesus.cineapp.pojos.Peliculas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
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
    
//    @PersistenceContext
//    private EntityManager entityManager;
   
    
    @Override
    public List<Peliculas> listaPeliculas(){
        
//        try {
//            List<Peliculas> peliculas= entityManager.createQuery("from Peliculas")
//                .getResultList();
//                    return peliculas;
//        } catch (Exception e) {
//            System.out.println("ERROR " + e);
//        }
//        return null;

        Session session = HibernateUtil.getSessionFactory().openSession();

 

        List<Peliculas> peliculas = (List<Peliculas>) session.createQuery("from Peliculas");



        return peliculas;
    }
}
