package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

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

    public Optional<CorridasModel> obtenerPorId(Long id){
        return corridasRepository.findById(id);
    }

    public boolean eliminarCorrida(Long id){
        try{
            corridasRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
