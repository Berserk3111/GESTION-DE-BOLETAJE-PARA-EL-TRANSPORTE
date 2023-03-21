package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

}
