/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.daoImp;

import com.jesus.cineapp.dao.UsuariosDao;
import com.jesus.cineapp.hibernate.HibernateUtil;
import com.jesus.cineapp.model.Usuario;
import com.jesus.cineapp.pojos.Perfil;
import com.jesus.cineapp.pojos.Usuarios;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author negocios_digitales
 */
@Repository
public class UsuariosDaoImp implements UsuariosDao{
    
    private static SessionFactory sessionFactory;
    private Session session;
    
    public UsuariosDaoImp(){
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
    public Boolean registrarUsuario(Usuario usuario){
        
        try {
            abrirSesion();

            Perfil perfil =  (Perfil) session.createQuery("from Perfil p where p.idPerfil = 2").uniqueResult();
            
            Usuarios user = new Usuarios();
            user.setPerfil(perfil);
            user.setPrimerNombre(usuario.getPrimerNombre());
            user.setSegundoNombre(usuario.getSegundoNombre());
            user.setPrimerApellido(usuario.getPrimerApellido());
            user.setSegundoApellido(usuario.getSegundoApellido());
            user.setUsuario(usuario.getUsuario());
            user.setContrasenia(usuario.getContrasenia());
            user.setEmail(usuario.getEmail());
            user.setEstatus("Activo");
            user.setFechaRegistro(new Date());
            user.setFechaModificacion(new Date());
            
            session.save(user);
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
    public Usuarios obtenerUsuario(Usuario usuario){
        
        try {
            abrirSesion();
            
//            Usuarios usuariosPojo = 
//                    (Usuarios) session.createQuery("from Usuarios u where u.email = :email")
//                            .setParameter("email", usuario.getEmail())
//                            .uniqueResult();

            
            List<Usuarios> list = session.createQuery("from Usuarios u where u.email = :email")
                              .setParameter("email", usuario.getEmail()).list();
            
            Usuarios usuariosPojo = list.get(1);
            if(usuariosPojo != null){
                if(usuariosPojo.getContrasenia().equals(usuario.getContrasenia())){
                    return usuariosPojo;
                }
            }  
            
        } catch (Exception e) {
            System.out.println("Error:::... " + e);
            cerrarSesion();
        } finally{
            cerrarSesion();
        }
        
        return null;
    }
}