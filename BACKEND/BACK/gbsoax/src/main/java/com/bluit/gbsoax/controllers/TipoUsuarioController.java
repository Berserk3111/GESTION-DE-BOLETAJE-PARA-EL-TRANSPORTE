package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
    
}
