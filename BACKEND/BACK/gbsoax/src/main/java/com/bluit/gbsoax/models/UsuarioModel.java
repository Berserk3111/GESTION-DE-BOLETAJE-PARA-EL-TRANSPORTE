package com.bluit.gbsoax.models;
//Aqui importamos la libreria para fechas
import java.sql.Date;
//Aqui importamos toddas las librerias de Java
import javax.persistence.*;

//Codigo para normbar la tabla
@Entity
@Table(name = "usuario")
public class UsuarioModel {
    //Generacion de campo ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String telefono;
    private Date fecha_nacimiento;    
    private String sexo;
    private String foto_perfil;
    private Integer numero_liecencia;
    private Integer numero_taquilla;
    //Relacion de muchos a uno con otra tabla, llave foranea
    @ManyToOne(fetch = 
    FetchType.EAGER)
    @JoinColumn(name = "id_tipoUser")
    private TipoUsuarioModel tipoUsuarioModel;

    //Funciones de Getters y Setters para obtener y escribir datos
    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }
    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

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
    public Integer getNumero_liecencia() {
        return numero_liecencia;
    }
    public void setNumero_liecencia(Integer numero_liecencia) {
        this.numero_liecencia = numero_liecencia;
    }
    public Integer getNumero_taquilla() {
        return numero_taquilla;
    }
    public void setNumero_taquilla(Integer numero_taquilla) {
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
