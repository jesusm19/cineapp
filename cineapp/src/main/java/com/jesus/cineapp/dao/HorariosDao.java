/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.dao;

import com.jesus.cineapp.model.Horario;
import com.jesus.cineapp.model.VHorariosPeliculas;
import com.jesus.cineapp.pojos.Horarios;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author negocios_digitales
 */
public interface HorariosDao {
    public Boolean guardarHorario(Horario horario);
    public List<VHorariosPeliculas> obtenerHorarios();
    public void guardaRelacionHoraPelicula(BigDecimal idPelicula);
}
