package com.jesus.cineapp.pojos;
// Generated 14/03/2018 12:15:52 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * UsuariosId generated by hbm2java
 */
public class UsuariosId  implements java.io.Serializable {


     private BigDecimal idUsuario;
     private BigDecimal idPerfil;

    public UsuariosId() {
    }

    public UsuariosId(BigDecimal idUsuario, BigDecimal idPerfil) {
       this.idUsuario = idUsuario;
       this.idPerfil = idPerfil;
    }
   
    public BigDecimal getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(BigDecimal idUsuario) {
        this.idUsuario = idUsuario;
    }
    public BigDecimal getIdPerfil() {
        return this.idPerfil;
    }
    
    public void setIdPerfil(BigDecimal idPerfil) {
        this.idPerfil = idPerfil;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof UsuariosId) ) return false;
		 UsuariosId castOther = ( UsuariosId ) other; 
         
		 return ( (this.getIdUsuario()==castOther.getIdUsuario()) || ( this.getIdUsuario()!=null && castOther.getIdUsuario()!=null && this.getIdUsuario().equals(castOther.getIdUsuario()) ) )
 && ( (this.getIdPerfil()==castOther.getIdPerfil()) || ( this.getIdPerfil()!=null && castOther.getIdPerfil()!=null && this.getIdPerfil().equals(castOther.getIdPerfil()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getIdUsuario() == null ? 0 : this.getIdUsuario().hashCode() );
         result = 37 * result + ( getIdPerfil() == null ? 0 : this.getIdPerfil().hashCode() );
         return result;
   }   


}


