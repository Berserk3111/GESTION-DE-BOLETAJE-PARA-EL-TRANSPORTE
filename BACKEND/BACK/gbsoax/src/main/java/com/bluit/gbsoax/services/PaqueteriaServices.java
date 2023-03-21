package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.PaqueteriaModel;
import com.bluit.gbsoax.repositories.PaqueteriaRepoitory;

@Service
public class PaqueteriaServices {
    @Autowired
    PaqueteriaRepoitory paqueteriaRepoitory;

    public ArrayList<PaqueteriaModel> obtenerPaquetes(){
        return (ArrayList<PaqueteriaModel>) paqueteriaRepoitory.findAll();
    }

    public PaqueteriaModel guardarPaquete(PaqueteriaModel paquete){
        return paqueteriaRepoitory.save(paquete);
    }

    public Optional<PaqueteriaModel> obtenerPorId(Long id){
        return paqueteriaRepoitory.findById(id);
    }

    public boolean eliminarPaquete(Long id){
        try{
            paqueteriaRepoitory.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
