package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
