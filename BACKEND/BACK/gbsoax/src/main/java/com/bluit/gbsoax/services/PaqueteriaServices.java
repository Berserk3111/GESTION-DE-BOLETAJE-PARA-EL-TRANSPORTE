package com.bluit.gbsoax.services;

import java.util.ArrayList;

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
}
