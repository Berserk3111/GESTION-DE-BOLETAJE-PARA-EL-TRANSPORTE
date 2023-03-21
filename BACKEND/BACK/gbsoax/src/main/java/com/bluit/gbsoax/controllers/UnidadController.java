package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.UnidadModel;
import com.bluit.gbsoax.services.UnidadServices;

@RestController
@RequestMapping("/unidad")
public class UnidadController {
    @Autowired
    UnidadServices unidadServices;

    @GetMapping()
    public ArrayList<UnidadModel> obtenerUnidades(){
        return unidadServices.obtenerUnidades();
    }

    @PostMapping()
    public UnidadModel guardarUnidad(@RequestBody UnidadModel unidad){
        return this.unidadServices.guardarUnidad(unidad);
    }
}
