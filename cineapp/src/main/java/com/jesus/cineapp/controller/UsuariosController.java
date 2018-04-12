/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.model.Usuario;
import com.jesus.cineapp.pojos.Perfil;
import com.jesus.cineapp.pojos.Usuarios;
import com.jesus.cineapp.service.UsuariosService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author negocios_digitales
 */
@Controller
public class UsuariosController {
    
    @Autowired
    private UsuariosService usuarioService;

    @RequestMapping(value="/registrarse", method = RequestMethod.GET)
    public String enviarModeloAlFormulario(Model model){
        model.addAttribute("usuario", new Usuario()); 
        return "registroUsuario/registro_usuario";
    }
    
    @RequestMapping(value="/registrarUsuarios", method=RequestMethod.POST)
    public String registrarUsuarios(@ModelAttribute("usuario") Usuario usuario, Model model){
        
        Usuarios usuarioPojo = usuarioService.buscarUsuario(usuario);
        
        if(usuarioPojo == null){
            boolean bandera = usuarioService.registrarUsuario(usuario);
        
            if(bandera == true){
                return "registroUsuario/exito";
            } else{
                model.addAttribute("error", "No se pudo registrar el usuario");
                return "registroUsuario/registro_usuario";
            }
        } else{
            model.addAttribute("error", "El correo electronico ya ha sido registrado");
                return "registroUsuario/registro_usuario";
        }
        
    }
    
    @RequestMapping(value="/empleados/create", method = RequestMethod.GET)
    public String crearEMpleado(Model model){
        model.addAttribute("usuario", new Usuario()); 
        List<Perfil> perfil = usuarioService.obtenerPerfiles();
        model.addAttribute("perfiles", perfil);
        
        
        return "registroUsuario/registro_usuario";
    }
}
