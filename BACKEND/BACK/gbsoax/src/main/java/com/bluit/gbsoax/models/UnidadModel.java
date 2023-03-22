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
    private Integer num_serie;
    private Integer num_placas;
    private Integer asientos_totales;
    private Integer asientos_adulto;
    private Integer asientos_adultom;
    private Integer asientos_niños;
    private Integer peso_unidad;

    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public Integer getNum_serie() {
        return num_serie;
    }
    public void setNum_serie(Integer num_serie) {
        this.num_serie = num_serie;
    }
    public Integer getNum_placas() {
        return num_placas;
    }
    public void setNum_placas(Integer num_placas) {
        this.num_placas = num_placas;
    }
    public Integer getAsientos_totales() {
        return asientos_totales;
    }
    public void setAsientos_totales(Integer asientos_totales) {
        this.asientos_totales = asientos_totales;
    }
    public Integer getAsientos_adulto() {
        return asientos_adulto;
    }
    public void setAsientos_adulto(Integer asientos_adulto) {
        this.asientos_adulto = asientos_adulto;
    }
    public Integer getAsientos_adultom() {
        return asientos_adultom;
    }
    public void setAsientos_adultom(Integer asientos_adultom) {
        this.asientos_adultom = asientos_adultom;
    }
    public Integer getAsientos_niños() {
        return asientos_niños;
    }
    public void setAsientos_niños(Integer asientos_niños) {
        this.asientos_niños = asientos_niños;
    }
    public Integer getPeso_unidad() {
        return peso_unidad;
    }
    public void setPeso_unidad(Integer peso_unidad) {
        this.peso_unidad = peso_unidad;
    }
    
}
