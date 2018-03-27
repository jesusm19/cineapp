/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.pojos.Peliculas;
import com.jesus.cineapp.service.PeliculasService;
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
public class PeliculasController {
    
    @Autowired
    private PeliculasService peliculasService;
    
    @RequestMapping(value="/peliculas", method=RequestMethod.GET)
    public String mostrarPrincipal(Model model){
        
        List<Peliculas> peliculas = peliculasService.listaPeliculas();
        model.addAttribute("peliculas", peliculas);
        return "peliculas/peliculas";
    }
}
