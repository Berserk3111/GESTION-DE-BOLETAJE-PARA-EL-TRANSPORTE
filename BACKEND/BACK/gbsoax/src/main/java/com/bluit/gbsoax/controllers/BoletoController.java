package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.BoletoModel;
import com.bluit.gbsoax.services.BoletoServices;

@RestController
@RequestMapping("/boleto")
public class BoletoController {
    @Autowired
    BoletoServices boletoServices;

    @GetMapping()
    public ArrayList<BoletoModel> obtenerBoletos(){
        return boletoServices.obtenerBoletos();
    }

    @PostMapping()
    public BoletoModel guardarBoleto(@RequestBody BoletoModel boleto){
        return this.boletoServices.guardarBoleto(boleto);
    }
}
