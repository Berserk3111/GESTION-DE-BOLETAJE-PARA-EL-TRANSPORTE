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

import com.bluit.gbsoax.models.PaqueteriaModel;
import com.bluit.gbsoax.services.PaqueteriaServices;

@RestController
@RequestMapping("/paqueteria")
public class PaqueteriaController {
    @Autowired
    PaqueteriaServices paqueteriaServices;

    @GetMapping()
    public ArrayList<PaqueteriaModel> obtenerPaquete(){
        return paqueteriaServices.obtenerPaquetes();
    }

    @PostMapping()
    public PaqueteriaModel guardarPaquete(@RequestBody PaqueteriaModel paquete){
        return this.paqueteriaServices.guardarPaquete(paquete);
    }

    @GetMapping(path = "/{id}")
    public Optional<PaqueteriaModel> obtenerPorid(@PathVariable("id") Long id){
        return this.paqueteriaServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.paqueteriaServices.eliminarPaquete(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }
}
