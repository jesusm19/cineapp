/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jesus.cineapp.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author negocios_digitales
 */
public class Horario {
    private BigDecimal idPelicula;
    private String fecha;
    private String hora;
    private BigDecimal idSala;
    private Double precio;

    public BigDecimal getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(BigDecimal idPelicula) {
        this.idPelicula = idPelicula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public BigDecimal getIdSala() {
        return idSala;
    }

    public void setIdSala(BigDecimal idSala) {
        this.idSala = idSala;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }
   
}
