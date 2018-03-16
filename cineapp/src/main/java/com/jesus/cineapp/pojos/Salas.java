package com.jesus.cineapp.pojos;
// Generated 15/03/2018 05:46:08 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Salas generated by hbm2java
 */
public class Salas  implements java.io.Serializable {


     private BigDecimal idSala;
     private String nombreSala;
     private Double precio;
     private Set<Horarios> horarioses = new HashSet<Horarios>(0);

    public Salas() {
    }

	
    public Salas(BigDecimal idSala) {
        this.idSala = idSala;
    }
    public Salas(BigDecimal idSala, String nombreSala, Double precio, Set<Horarios> horarioses) {
       this.idSala = idSala;
       this.nombreSala = nombreSala;
       this.precio = precio;
       this.horarioses = horarioses;
    }
   
    public BigDecimal getIdSala() {
        return this.idSala;
    }
    
    public void setIdSala(BigDecimal idSala) {
        this.idSala = idSala;
    }
    public String getNombreSala() {
        return this.nombreSala;
    }
    
    public void setNombreSala(String nombreSala) {
        this.nombreSala = nombreSala;
    }
    public Double getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(Double precio) {
        this.precio = precio;
    }
    public Set<Horarios> getHorarioses() {
        return this.horarioses;
    }
    
    public void setHorarioses(Set<Horarios> horarioses) {
        this.horarioses = horarioses;
    }




}


