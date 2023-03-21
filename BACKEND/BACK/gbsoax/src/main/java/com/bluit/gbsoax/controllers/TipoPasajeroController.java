package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
    
}
