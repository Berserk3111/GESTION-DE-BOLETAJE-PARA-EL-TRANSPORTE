package com.bluit.gbsoax.models;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.*;


@Entity
@Table(name ="corridas")
public class CorridasModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true,nullable = false)
    private long id_corrida;

    public long getId_corrida() {
        return id_corrida;
    }

    public void setId_corrida(long id_corrida) {
        this.id_corrida = id_corrida;
    }

    private Date fecha;
    private Time hora;
    private String ciudad_origen;
    private String municipio_origen;
    private String longitud_origen;
    private String latitud_origen;
    private String ciudad_destino;
    private String municipio_destino;
    private String lingitud_destino;
    private String latitud_destino;
    private String origen;
    private String destino;

    

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_unidad")
    private UnidadModel unidadModel;

    public UnidadModel getUnidadModel() {
        return unidadModel;
    }

    public void setUnidadModel(UnidadModel unidadModel) {
        this.unidadModel = unidadModel;
    }

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_costo")
    private CostosModel costosModel;

    public CostosModel getCostosModel() {
        return costosModel;
    }

    public void setCostosModel(CostosModel costosModel) {
        this.costosModel = costosModel;
    }

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id")
    private UsuarioModel usuarioModel;


    public UsuarioModel getUsuarioModel() {
        return usuarioModel;
    }

    public void setUsuarioModel(UsuarioModel usuarioModel) {
        this.usuarioModel = usuarioModel;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getCiudad_origen() {
        return ciudad_origen;
    }

    public void setCiudad_origen(String ciudad_origen) {
        this.ciudad_origen = ciudad_origen;
    }

    public String getMunicipio_origen() {
        return municipio_origen;
    }

    public void setMunicipio_origen(String municipio_origen) {
        this.municipio_origen = municipio_origen;
    }

    public String getLongitud_origen() {
        return longitud_origen;
    }

    public void setLongitud_origen(String longitud_origen) {
        this.longitud_origen = longitud_origen;
    }

    public String getLatitud_origen() {
        return latitud_origen;
    }

    public void setLatitud_origen(String latitud_origen) {
        this.latitud_origen = latitud_origen;
    }

    public String getCiudad_destino() {
        return ciudad_destino;
    }

    public void setCiudad_destino(String ciudad_destino) {
        this.ciudad_destino = ciudad_destino;
    }

    public String getMunicipio_destino() {
        return municipio_destino;
    }

    public void setMunicipio_destino(String municipio_destino) {
        this.municipio_destino = municipio_destino;
    }

    public String getLingitud_destino() {
        return lingitud_destino;
    }

    public void setLingitud_destino(String lingitud_destino) {
        this.lingitud_destino = lingitud_destino;
    }

    public String getLatitud_destino() {
        return latitud_destino;
    }

    public void setLatitud_destino(String latitud_destino) {
        this.latitud_destino = latitud_destino;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
    
}
