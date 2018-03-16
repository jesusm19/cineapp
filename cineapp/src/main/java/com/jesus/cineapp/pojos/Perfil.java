package com.jesus.cineapp.pojos;
// Generated 15/03/2018 05:46:08 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Perfil generated by hbm2java
 */
public class Perfil  implements java.io.Serializable {


     private BigDecimal idPerfil;
     private String descripcion;
     private Set<Usuarios> usuarioses = new HashSet<Usuarios>(0);

    public Perfil() {
    }

	
    public Perfil(BigDecimal idPerfil) {
        this.idPerfil = idPerfil;
    }
    public Perfil(BigDecimal idPerfil, String descripcion, Set<Usuarios> usuarioses) {
       this.idPerfil = idPerfil;
       this.descripcion = descripcion;
       this.usuarioses = usuarioses;
    }
   
    public BigDecimal getIdPerfil() {
        return this.idPerfil;
    }
    
    public void setIdPerfil(BigDecimal idPerfil) {
        this.idPerfil = idPerfil;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set<Usuarios> getUsuarioses() {
        return this.usuarioses;
    }
    
    public void setUsuarioses(Set<Usuarios> usuarioses) {
        this.usuarioses = usuarioses;
    }




}


