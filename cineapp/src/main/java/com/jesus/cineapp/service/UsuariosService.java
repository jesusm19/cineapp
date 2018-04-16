/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.service;

import com.jesus.cineapp.model.Usuario;
import com.jesus.cineapp.pojos.Perfil;
import com.jesus.cineapp.pojos.Usuarios;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author negocios_digitales
 */
public interface UsuariosService {
    public Boolean registrarUsuario(Usuario usuario);
    public Usuarios obtenerUsuario(Usuario usuario);
    public Usuarios buscarUsuario(Usuario usuario);
    public List<Usuarios> obtenerEmpleados();
    public List<Perfil> obtenerPerfiles();
    public Boolean eliminarEmpleado(BigDecimal id);
}
