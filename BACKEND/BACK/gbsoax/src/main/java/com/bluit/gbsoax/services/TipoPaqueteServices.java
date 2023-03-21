package com.bluit.gbsoax.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.TipoPaqueteModel;
import com.bluit.gbsoax.repositories.TipoPaqueteRepository;

@Service
public class TipoPaqueteServices {
    @Autowired
    TipoPaqueteRepository tipoPaqueteRepository;

    public ArrayList<TipoPaqueteModel> obtenerTipopaquetes(){
        return (ArrayList<TipoPaqueteModel>) tipoPaqueteRepository.findAll();
    }

    public TipoPaqueteModel guardarPaquete(TipoPaqueteModel tipopaquete){
        return tipoPaqueteRepository.save(tipopaquete);
    }
}
