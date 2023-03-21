package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

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

    public Optional<TipoPaqueteModel> obtenerPorId(Long id){
        return tipoPaqueteRepository.findById(id);
    }

    public boolean eliminarTipoPaquete(Long id){
        try{
            tipoPaqueteRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
