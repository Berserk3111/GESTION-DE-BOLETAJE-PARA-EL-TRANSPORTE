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

import com.bluit.gbsoax.models.BoletoModel;
import com.bluit.gbsoax.repositories.BoletoRepository;
import com.bluit.gbsoax.services.BoletoServices;

@RestController
@RequestMapping("/boleto") 
public class BoletoController {
    private final BoletoRepository boletoRepository;
    @Autowired
    public BoletoController(BoletoRepository boletoRepository){
        this.boletoRepository = boletoRepository;
    }
    BoletoServices boletoServices;

    @GetMapping()
    public ArrayList<BoletoModel> obtenerBoletos(){
        return boletoServices.obtenerBoletos();
    }

    /* @PostMapping()
    public BoletoModel guardarBoleto(@RequestBody BoletoModel boleto){
        return this.boletoServices.guardarBoleto(boleto);
    } */

    @GetMapping(path = "/{id}")
    public Optional<BoletoModel> obtenerPorid(@PathVariable("id") Long id){
        return this.boletoServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.boletoServices.eliminarBoleto(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }

    @PostMapping("/api/insertData")
    public String insertData(@RequestBody BoletoModel dataDto){
        BoletoModel boletoModel = new BoletoModel(dataDto.getNombre(), dataDto.getEmail());
        boletoRepository.save(boletoModel);
        return "Datos guardados";
    }

}
