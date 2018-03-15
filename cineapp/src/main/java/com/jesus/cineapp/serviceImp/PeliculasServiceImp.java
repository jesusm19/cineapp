/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.serviceImp;

import com.jesus.cineapp.dao.PeliculasDao;
import com.jesus.cineapp.pojos.Peliculas;
import com.jesus.cineapp.service.PeliculasService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author negocios_digitales
 */
@Service
public class PeliculasServiceImp implements PeliculasService{
    
    @Autowired
    PeliculasDao peliculasDao;
    
    @Override
    public List<Peliculas> listaPeliculas(){
        return peliculasDao.listaPeliculas();
    }
}
