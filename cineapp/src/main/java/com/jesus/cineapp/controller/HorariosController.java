/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.controller;

import com.jesus.cineapp.model.Horario;
import com.jesus.cineapp.model.VHorariosPeliculas;
import com.jesus.cineapp.pojos.Horarios;
import com.jesus.cineapp.pojos.Peliculas;
import com.jesus.cineapp.pojos.Salas;
import com.jesus.cineapp.service.HorariosService;
import com.jesus.cineapp.service.PeliculasService;
import com.jesus.cineapp.service.SalasService;
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
public class HorariosController {
    
    @Autowired
    private PeliculasService peliculasService;
    
    @Autowired
    private SalasService salasService;
    
    @Autowired 
    private HorariosService horariosService;
    
    @RequestMapping(value="/horarios", method=RequestMethod.GET)
    public String mostrarPrincipal(Model model){
        
        List<VHorariosPeliculas> horarios = horariosService.obtenerHorarios();
        model.addAttribute("horarios", horarios);
        return "horarios/horarios";
    }
    
    @RequestMapping(value="/horarios/create", method = RequestMethod.GET)
    public String crearHorario(Model model){
        model.addAttribute("horario", new Horario());
        List<Peliculas> peliculas = peliculasService.listaPeliculas();
        List<Salas> salas = salasService.obtenerSalas();
        model.addAttribute("peliculas", peliculas);
        model.addAttribute("salas", salas);
        
        return "horarios/crearHorario";
    }
    
    @RequestMapping(value="/horarios/save", method= RequestMethod.POST)
    public String guardarHorario(@ModelAttribute("horario") Horario horario, Model model){
        
        Boolean bandera = horariosService.guardarHorario(horario);
        
        if (bandera == true){
            horariosService.guardaRelacionHoraPelicula(horario.getIdPelicula());
            return "horarios/horarios";
        } else{
            model.addAttribute("error", "No se pudo agregar horario");
            return "horarios/crearHorario";
        }
    }
}
