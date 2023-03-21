package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name= "costos")
public class CostosModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id_costo;
    
    private Number costo;
    public Long getId_costo() {
        return id_costo;
    }
    public void setId_costo(Long id_costo) {
        this.id_costo = id_costo;
    }
    public Number getCosto() {
        return costo;
    }
    public void setCosto(Number costo) {
        this.costo = costo;
    }
    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_tipo_pasajero")
    private TipoPasajeroModel tipoPasajeroModel;
    public TipoPasajeroModel getTipoPasajeroModel() {
        return tipoPasajeroModel;
    }
    public void setTipoPasajeroModel(TipoPasajeroModel tipoPasajeroModel) {
        this.tipoPasajeroModel = tipoPasajeroModel;
    }
}
