package com.bluit.gbsoax.models;


import java.sql.Date;

import javax.persistence.*;


@Entity
@Table(name = "usuario")
public class UsuarioModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    
    private Long id;

    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String telefono;
    private Date fecha_nacimiento;
    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }
    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    private String sexo;
    private String foto_perfil;
    private Number numero_liecencia;
    private Number numero_taquilla;

    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_tipoUser")
    private TipoUsuarioModel tipoUsuarioModel;



    public TipoUsuarioModel getTipoUsuarioModel() {
        return tipoUsuarioModel;
    }
    public void setTipoUsuarioModel(TipoUsuarioModel tipoUsuarioModel) {
        this.tipoUsuarioModel = tipoUsuarioModel;
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
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getSexo() {
        return sexo;
    }
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    public String getFoto_perfil() {
        return foto_perfil;
    }
    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }
    public Number getNumero_liecencia() {
        return numero_liecencia;
    }
    public void setNumero_liecencia(Number numero_liecencia) {
        this.numero_liecencia = numero_liecencia;
    }
    public Number getNumero_taquilla() {
        return numero_taquilla;
    }
    public void setNumero_taquilla(Number numero_taquilla) {
        this.numero_taquilla = numero_taquilla;
    }
    public Long getId()
    {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
}
