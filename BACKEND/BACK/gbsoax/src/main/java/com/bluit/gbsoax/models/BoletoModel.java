package com.bluit.gbsoax.models;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "boleto")
public class BoletoModel {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id_boleto;

    public Long getId_boleto() {
        return id_boleto;
    }

    public void setId_boleto(Long id_boleto) {
        this.id_boleto = id_boleto;
    }

    private Date fecha_compra;
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private Date fecha_nacimiento;
    private String email;
    private Integer telefono;

    

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_costo")
    private CostosModel costosModel;

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_corrida")
    private CorridasModel corridasModel;

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name ="id")
    private UsuarioModel usuarioModel;


    public CostosModel getCostosModel() {
        return costosModel;
    }

    public void setCostosModel(CostosModel costosModel) {
        this.costosModel = costosModel;
    }

    public CorridasModel getCorridasModel() {
        return corridasModel;
    }

    public void setCorridasModel(CorridasModel corridasModel) {
        this.corridasModel = corridasModel;
    }

    public UsuarioModel getUsuarioModel() {
        return usuarioModel;
    }

    public void setUsuarioModel(UsuarioModel usuarioModel) {
        this.usuarioModel = usuarioModel;
    }

    public Date getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(Date fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Number getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }
}
