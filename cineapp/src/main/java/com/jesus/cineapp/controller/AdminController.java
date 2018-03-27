/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.pojos.Usuarios;
import com.jesus.cineapp.service.UsuariosService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author negocios_digitales
 */
@Controller
public class AdminController {
    
    @Autowired
    private UsuariosService usuarioService;
    
    @RequestMapping(value="/inicio", method=RequestMethod.GET)
    public String inicio(){
        return "admin";
    }
    
    @RequestMapping(value="/empleados", method=RequestMethod.GET)
    public String getEmpleados(Model model){
        
        List<Usuarios> usuariosPojo = usuarioService.obtenerEmpleados();
        model.addAttribute("empleados", usuariosPojo);
        return "registroUsuario/empleados";
    }
}
