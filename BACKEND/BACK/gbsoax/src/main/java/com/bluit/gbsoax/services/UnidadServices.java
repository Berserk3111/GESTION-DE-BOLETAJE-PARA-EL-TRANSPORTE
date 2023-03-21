package com.bluit.gbsoax.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.UnidadModel;
import com.bluit.gbsoax.repositories.UnidadRepository;

@Service
public class UnidadServices {
    @Autowired
    UnidadRepository unidadRepository;

    public ArrayList<UnidadModel> obtenerUnidades(){
        return (ArrayList<UnidadModel>) unidadRepository.findAll();
    }

    public UnidadModel guardarUnidad(UnidadModel unidad){
        return unidadRepository.save(unidad);
    }    
}
