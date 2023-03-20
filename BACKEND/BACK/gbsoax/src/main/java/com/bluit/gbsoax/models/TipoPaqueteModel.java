package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name= "TipoPaquete")
public class TipoPaqueteModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)

    private Long id_tipopaquete;
    private String tipo;
    
    public Long getId_tipopaquete() {
        return id_tipopaquete;
    }
    public void setId_tipopaquete(Long id_tipopaquete) {
        this.id_tipopaquete = id_tipopaquete;
    }
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
