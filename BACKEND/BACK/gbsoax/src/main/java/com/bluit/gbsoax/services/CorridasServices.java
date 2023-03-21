package com.bluit.gbsoax.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.CorridasModel;
import com.bluit.gbsoax.repositories.CorridasRepository;

@Service
public class CorridasServices {
    @Autowired
    CorridasRepository corridasRepository;

    public ArrayList<CorridasModel> obtenerCorridas(){
        return (ArrayList<CorridasModel>) corridasRepository.findAll();
    }

    public CorridasModel guardarCorridas(CorridasModel corrida){
        return corridasRepository.save(corrida);
    }
}
