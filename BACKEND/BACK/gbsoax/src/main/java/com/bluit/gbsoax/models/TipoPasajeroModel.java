package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table (name = "tipopasajero")
public class TipoPasajeroModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)

    private Long id_tipo_pasajero;
    private String tipo_pasajero;
    
    public Long getId_tipo_pasajero() {
        return id_tipo_pasajero;
    }
    public void setId_tipo_pasajero(Long id_tipo_pasajero) {
        this.id_tipo_pasajero = id_tipo_pasajero;
    }
    public String getTipo_pasajero() {
        return tipo_pasajero;
    }
    public void setTipo_pasajero(String tipo_pasajero) {
        this.tipo_pasajero = tipo_pasajero;
    }

    
}
