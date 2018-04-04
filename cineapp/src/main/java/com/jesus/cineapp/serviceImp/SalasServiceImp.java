/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.serviceImp;

import com.jesus.cineapp.dao.SalasDao;
import com.jesus.cineapp.pojos.Salas;
import com.jesus.cineapp.service.SalasService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author negocios_digitales
 */
@Service
public class SalasServiceImp implements SalasService{
    
    @Autowired
    private SalasDao salasDao;
    
    @Override
    public List<Salas> obtenerSalas(){
        return  salasDao.obtenerSalas();
    }
}
