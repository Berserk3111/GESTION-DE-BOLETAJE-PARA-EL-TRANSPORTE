package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name = "paqueteria")
public class PaqueteriaModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true,nullable = false)

    private Long id_paquete;
    private Number largo;
    private Number ancho;
    private Number peso;
    private String nombre_envia;
    private String nombre_recibe;
    private String destino;
    private String descripcion;
    private String correo;
    private Number telefono;
    private Number precio_total;
    private Number num_seguimiento;

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_corrida")
    private CorridasModel corridasModel;

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_tipopaquete")
    private TipoPaqueteModel tipoPaqueteModel;

    public CorridasModel getCorridasModel() {
        return corridasModel;
    }
    public void setCorridasModel(CorridasModel corridasModel) {
        this.corridasModel = corridasModel;
    }
    public TipoPaqueteModel getTipoPaqueteModel() {
        return tipoPaqueteModel;
    }
    public void setTipoPaqueteModel(TipoPaqueteModel tipoPaqueteModel) {
        this.tipoPaqueteModel = tipoPaqueteModel;
    }
    public Long getId_paquete() {
        return id_paquete;
    }
    public void setId_paquete(Long id_paquete) {
        this.id_paquete = id_paquete;
    }
    public Number getLargo() {
        return largo;
    }
    public void setLargo(Number largo) {
        this.largo = largo;
    }
    public Number getAncho() {
        return ancho;
    }
    public void setAncho(Number ancho) {
        this.ancho = ancho;
    }
    public Number getPeso() {
        return peso;
    }
    public void setPeso(Number peso) {
        this.peso = peso;
    }
    public String getNombre_envia() {
        return nombre_envia;
    }
    public void setNombre_envia(String nombre_envia) {
        this.nombre_envia = nombre_envia;
    }
    public String getNombre_recibe() {
        return nombre_recibe;
    }
    public void setNombre_recibe(String nombre_recibe) {
        this.nombre_recibe = nombre_recibe;
    }
    public String getDestino() {
        return destino;
    }
    public void setDestino(String destino) {
        this.destino = destino;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public Number getTelefono() {
        return telefono;
    }
    public void setTelefono(Number telefono) {
        this.telefono = telefono;
    }
    public Number getPrecio_total() {
        return precio_total;
    }
    public void setPrecio_total(Number precio_total) {
        this.precio_total = precio_total;
    }
    public Number getNum_seguimiento() {
        return num_seguimiento;
    }
    public void setNum_seguimiento(Number num_seguimiento) {
        this.num_seguimiento = num_seguimiento;
    }

    
}
