/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.serviceImp;

import com.jesus.cineapp.dao.UsuariosDao;
import com.jesus.cineapp.model.Usuario;
import com.jesus.cineapp.pojos.Perfil;
import com.jesus.cineapp.pojos.Usuarios;
import com.jesus.cineapp.service.UsuariosService;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author negocios_digitales
 */
@Service
public class UsuariosServiceImp implements UsuariosService{
    
    @Autowired
    private UsuariosDao usuariosDao;
    
    @Override
    public Boolean registrarUsuario(Usuario usuario){
        return usuariosDao.registrarUsuario(usuario);
        
    }
    
    @Override
    public Usuarios obtenerUsuario(Usuario usuario){
        return usuariosDao.obtenerUsuario(usuario);
    }
    
    @Override
    public Usuarios buscarUsuario(Usuario usuario){
        return usuariosDao.buscarUsuario(usuario);
    }
    
    @Override
    public List<Usuarios> obtenerEmpleados(){
        return usuariosDao.obtenerEmpleados();
    }
    
    @Override
    public List<Perfil> obtenerPerfiles(){
        return usuariosDao.obtenerPerfiles();
    }
    
    @Override
    public Boolean eliminarEmpleado(BigDecimal id){
        return usuariosDao.eliminarEmpleado(id);
    }
    
    @Override
    public Usuarios obtenerEmpleadoPorId(BigDecimal id){
        return usuariosDao.obtenerEmpleadoPorId(id);
    }
    
    @Override
    public Boolean actualizarEmpleado(Usuario usuario){
        return usuariosDao.actualizarEmpleado(usuario);
    }
}
