/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.model.Usuario;
import com.jesus.cineapp.pojos.Peliculas;
import com.jesus.cineapp.pojos.Usuarios;
import com.jesus.cineapp.service.PeliculasService;
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
public class HomeController {
    
    @Autowired
    private PeliculasService peliculasService;
    
    @Autowired
    private UsuariosService usuarioService;
    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    public String goHome(){
        return "home";
    }
    
    @RequestMapping(value="/peliculas", method=RequestMethod.GET)
    public String mostrarPrincipal(Model model){
        
        List<Peliculas> peliculas = peliculasService.listaPeliculas();
        model.addAttribute("peliculas", peliculas);
        return "home";
    }
    
    @RequestMapping(value="/detail")
    public String mostrarDetalle(Model model){
        String tituloPelicula= "Rapidos y furiosos";
        int duracion = 136;
        double precioEntrada = 50;
        
        model.addAttribute("titulo", tituloPelicula);
        model.addAttribute("duracion", duracion);
        model.addAttribute("precio", precioEntrada);
        
        return "detalle";
    }
    
    /****************INICIA LOGIN**********************************/
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String login(@ModelAttribute("login") Usuario usuario){
        return "login/login";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String loginEnter(@ModelAttribute("login") Usuario usuario){
        return "login/login";
    }
    
    @RequestMapping(value="/bienvenido", method=RequestMethod.POST)
    public String bienvenido(@ModelAttribute("usuario") Usuario usuario, Model model){
        
        Usuarios usuarioPojo = usuarioService.obtenerUsuario(usuario);
        
        if(usuarioPojo != null){
            model.addAttribute("usuario", usuarioPojo.getUsuario());
            return "bienvenido";
        } else{
            model.addAttribute("error", "Usuario o Contraseña incorrectos");
            return "login/login";
        }
    }
    
    /*******************TERMINA LOGIN*******************************/
    
}