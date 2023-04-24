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

import com.bluit.gbsoax.models.TipoPaqueteModel;
import com.bluit.gbsoax.services.TipoPaqueteServices;

@RestController
@RequestMapping("/tipopaquete")
public class TipoPaqueteController {
    @Autowired
    TipoPaqueteServices tipoPaqueteServices;

    @GetMapping()
    public ArrayList<TipoPaqueteModel> obtenerPaquetes(){
        return tipoPaqueteServices.obtenerTipopaquetes();
    }

    @PostMapping()
    public TipoPaqueteModel guardarTipopaquete(@RequestBody TipoPaqueteModel tipopaquete){
        return this.tipoPaqueteServices.guardarPaquete(tipopaquete);
    }

    @GetMapping(path = "/{id}")
    public Optional<TipoPaqueteModel> obtenerPorid(@PathVariable("id") Long id){
        return this.tipoPaqueteServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.tipoPaqueteServices.eliminarTipoPaquete(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }

}
