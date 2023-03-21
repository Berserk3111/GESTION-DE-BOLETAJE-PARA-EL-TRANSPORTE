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

    @GetMapping(path = "/{id}")
    public Optional<UnidadModel> obtenerPorid(@PathVariable("id") Long id){
        return this.unidadServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUnidad(@PathVariable("id") long id){
        boolean ok = this.unidadServices.eliminarUnidad(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }
}
