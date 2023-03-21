package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.CostosModel;
import com.bluit.gbsoax.services.CostosServices;
@RestController
@RequestMapping("/costos")
public class CostosController {
    @Autowired
    CostosServices costosServices;

    @GetMapping()
    public ArrayList<CostosModel> obtenerCostos(){
        return costosServices.obtenerCosotos();
    }

    @PostMapping()
    public CostosModel guardarCostos(@RequestBody CostosModel costo){
        return this.costosServices.guardarCostos(costo);
    }
}
