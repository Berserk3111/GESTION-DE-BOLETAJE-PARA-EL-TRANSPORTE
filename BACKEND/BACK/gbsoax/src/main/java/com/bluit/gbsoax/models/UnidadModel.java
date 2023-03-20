package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name = "unidad")
public class UnidadModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id_unidad;

    public Long getId_unidad() {
        return id_unidad;
    }
    public void setId_unidad(Long id_unidad) {
        this.id_unidad = id_unidad;
    }
    private String modelo;
    private Number num_serie;
    private Number num_placas;
    private Number asientos_totales;
    private Number asientos_adulto;
    private Number asientos_adultom;
    private Number asientos_niños;
    private Number peso_unidad;

    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public Number getNum_serie() {
        return num_serie;
    }
    public void setNum_serie(Number num_serie) {
        this.num_serie = num_serie;
    }
    public Number getNum_placas() {
        return num_placas;
    }
    public void setNum_placas(Number num_placas) {
        this.num_placas = num_placas;
    }
    public Number getAsientos_totales() {
        return asientos_totales;
    }
    public void setAsientos_totales(Number asientos_totales) {
        this.asientos_totales = asientos_totales;
    }
    public Number getAsientos_adulto() {
        return asientos_adulto;
    }
    public void setAsientos_adulto(Number asientos_adulto) {
        this.asientos_adulto = asientos_adulto;
    }
    public Number getAsientos_adultom() {
        return asientos_adultom;
    }
    public void setAsientos_adultom(Number asientos_adultom) {
        this.asientos_adultom = asientos_adultom;
    }
    public Number getAsientos_niños() {
        return asientos_niños;
    }
    public void setAsientos_niños(Number asientos_niños) {
        this.asientos_niños = asientos_niños;
    }
    public Number getPeso_unidad() {
        return peso_unidad;
    }
    public void setPeso_unidad(Number peso_unidad) {
        this.peso_unidad = peso_unidad;
    }
    
}
