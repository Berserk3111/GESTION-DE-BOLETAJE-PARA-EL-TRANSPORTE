package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name = "tipo_usuario")
public class TipoUsuarioModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    
    private Long id_tipoUser;
    private String tipo;
    
    public Long getId_tipoUser() {
        return id_tipoUser;
    }
    public void setId_tipoUser(Long id_tipoUser) {
        this.id_tipoUser = id_tipoUser;
    }
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }


    
}
