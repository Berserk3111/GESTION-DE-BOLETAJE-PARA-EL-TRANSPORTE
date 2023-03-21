package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

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
    
    public Optional<UnidadModel> obtenerPorId(Long id){
        return unidadRepository.findById(id);
    }

    public boolean eliminarUnidad(Long id){
        try{
            unidadRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }

}
