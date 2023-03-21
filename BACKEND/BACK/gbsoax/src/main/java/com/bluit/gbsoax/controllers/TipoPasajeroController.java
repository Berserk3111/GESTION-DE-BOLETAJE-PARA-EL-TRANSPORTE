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

import com.bluit.gbsoax.models.TipoPasajeroModel;
import com.bluit.gbsoax.services.TipoPasajeroServices;

@RestController
@RequestMapping("/tipopasajero")
public class TipoPasajeroController {
    @Autowired
    TipoPasajeroServices tipoPasajeroServices;

    @GetMapping()
    public ArrayList<TipoPasajeroModel> obtenerTipopasajero(){
        return tipoPasajeroServices.obtenerTipopasajeros();
    }

    @PostMapping()
    public TipoPasajeroModel guardarPasajero(@RequestBody TipoPasajeroModel pasajero){
        return this.tipoPasajeroServices.guardarTipopasajero(pasajero);
    }

    @GetMapping(path = "/{id}")
    public Optional<TipoPasajeroModel> obtenerPorid(@PathVariable("id") Long id){
        return this.tipoPasajeroServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.tipoPasajeroServices.eliminarTipoPasajero(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }
    
}
