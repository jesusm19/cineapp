/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.serviceImp;

import com.jesus.cineapp.dao.HorariosDao;
import com.jesus.cineapp.model.Horario;
import com.jesus.cineapp.model.VHorariosPeliculas;
import com.jesus.cineapp.pojos.Horarios;
import com.jesus.cineapp.service.HorariosService;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author negocios_digitales
 */
@Service
public class HorariosServiceImp implements HorariosService{
    
    @Autowired
    private HorariosDao horariosDao;
    
    @Override
    public Boolean guardarHorario(Horario horario){
        return horariosDao.guardarHorario(horario);
    }
    
    @Override
    public List<VHorariosPeliculas> obtenerHorarios(){
        return horariosDao.obtenerHorarios();
    }
    
    @Override
    public void guardaRelacionHoraPelicula(BigDecimal idPelicula){
        horariosDao.guardaRelacionHoraPelicula(idPelicula);
    }
    
    @Override
    public Boolean eliminarHorario(BigDecimal id){
        return horariosDao.eliminarHorario(id);
    }
}
