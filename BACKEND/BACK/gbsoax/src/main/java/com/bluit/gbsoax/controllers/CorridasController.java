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

import com.bluit.gbsoax.models.CorridasModel;
import com.bluit.gbsoax.services.CorridasServices;

@RestController
@RequestMapping("/corridas")
public class CorridasController {
    @Autowired
    CorridasServices corridasServices;

    @GetMapping()
    public ArrayList<CorridasModel> obtenerCorridas(){
        return corridasServices.obtenerCorridas();
    }
    @PostMapping()
    public CorridasModel guardarCorrida(@RequestBody CorridasModel corrida){
        return this.corridasServices.guardarCorridas(corrida);
    }

    @GetMapping(path = "/{id}")
    public Optional<CorridasModel> obtenerPorid(@PathVariable("id") Long id){
        return this.corridasServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.corridasServices.eliminarCorrida(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }
}
