package com.bluit.gbsoax.controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.TipoUsuarioModel;
import com.bluit.gbsoax.services.TipoUsuarioServices;

@RestController
@RequestMapping("/tusuario")
public class TipoUsuarioController {
    @Autowired
    TipoUsuarioServices tipoUsuarioServices;

    @GetMapping()
    public ArrayList<TipoUsuarioModel> obtenerTipoUsuarios(){
        return tipoUsuarioServices.obtenerTipoUsuarios();
    }

    @PostMapping()
    public TipoUsuarioModel guardarTipoUsuario(@RequestBody TipoUsuarioModel Tusuario){
        return this.tipoUsuarioServices.guardarTipoUsuario(Tusuario);
    }
    
    @GetMapping(path = "/{id}")
    public Optional<TipoUsuarioModel> obtenerPorid(@PathVariable("id") Long id){
        return this.tipoUsuarioServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarTipoUsuario(@PathVariable("id") long id){
        boolean ok = this.tipoUsuarioServices.eliminarTipoUsuario(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }
}
