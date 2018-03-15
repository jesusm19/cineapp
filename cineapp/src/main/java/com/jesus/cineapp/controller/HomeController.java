/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.model.Pelicula;
import com.jesus.cineapp.pojos.Peliculas;
import com.jesus.cineapp.service.PeliculasService;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
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
public class HomeController {
    
    @Autowired
    private PeliculasService peliculasService;
    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    public String goHome(){
        return "home";
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String mostrarPrincipal(Model model){
        
        //List<Pelicula> peliculas = getLista();
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
    
    //Metodo para generar una lista de objetos de modelo Pelicula
    private List<Pelicula> getLista(){
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        List<Pelicula> list = null;
        
        try {
            list = new LinkedList();
            
            Pelicula p1 = new Pelicula();
            p1.setId(1);
            p1.setTitulo("Power Rangers");
            p1.setDuracion(120);
            p1.setClasificacion("B");
            p1.setGenero("Aventura");
            p1.setFechaEstreno(formatter.parse("20-05-2017"));
            p1.setImagen("power.png");
            
            Pelicula p2 = new Pelicula();
            p2.setId(2);
            p2.setTitulo("La bella y la bestia");
            p2.setDuracion(132);
            p2.setClasificacion("A");
            p2.setGenero("Infantil");
            p2.setFechaEstreno(formatter.parse("20-05-2017"));
            p2.setImagen("bella.jpg");
            
            Pelicula p3 = new Pelicula();
            p3.setId(3);
            p3.setTitulo("Contratiempo");
            p3.setDuracion(106);
            p3.setClasificacion("B");
            p3.setGenero("Thriller");
            p3.setFechaEstreno(formatter.parse("20-05-2017"));
            
            Pelicula p4 = new Pelicula();
            p4.setId(4);
            p4.setTitulo("La forma del agua");
            p4.setDuracion(136);
            p4.setClasificacion("B");
            p4.setGenero("Acción");
            p4.setFechaEstreno(formatter.parse("20-05-2017"));
            p4.setImagen("forma.jpg");
            p4.setEstatus("Inactiva");
            
            list.add(p1);
            list.add(p2);
            list.add(p3);
            list.add(p4);
            
            return list;
        } catch (ParseException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
        
    }
}