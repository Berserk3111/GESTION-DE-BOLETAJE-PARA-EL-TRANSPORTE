package com.bluit.gbsoax.controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.UsuarioModel;
import com.bluit.gbsoax.services.UsuarioServices;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {
    @Autowired
    UsuarioServices usuarioServices;

    @GetMapping()
    public ArrayList<UsuarioModel> obtenerUsuarios(){
        return usuarioServices.obtenerUsuarios();
    }

    @PostMapping()
    public UsuarioModel guardarUsuario(UsuarioModel usuario){
        return this.usuarioServices.guardarUsuario(usuario);
    }

    @GetMapping( path = "/{id}")
    public Optional<UsuarioModel> obtenerPorid(@PathVariable("id") Long id){
        return this.usuarioServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.usuarioServices.eliminarUsuario(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }


}
