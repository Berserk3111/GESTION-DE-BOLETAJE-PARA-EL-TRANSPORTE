package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
