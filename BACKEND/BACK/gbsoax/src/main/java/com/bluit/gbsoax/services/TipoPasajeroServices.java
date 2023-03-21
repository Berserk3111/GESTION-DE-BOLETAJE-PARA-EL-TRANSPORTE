package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.TipoPasajeroModel;
import com.bluit.gbsoax.repositories.TipoPasajeroRepository;

@Service
public class TipoPasajeroServices {
    @Autowired
    TipoPasajeroRepository tipoPasajeroRepository;

    public ArrayList<TipoPasajeroModel> obtenerTipopasajeros(){
        return (ArrayList<TipoPasajeroModel>) tipoPasajeroRepository.findAll();
    }

    public TipoPasajeroModel guardarTipopasajero(TipoPasajeroModel tipopasajero){
        return tipoPasajeroRepository.save(tipopasajero);
    }

    public Optional<TipoPasajeroModel> obtenerPorId(Long id){
        return tipoPasajeroRepository.findById(id);
    }

    public boolean eliminarTipoPasajero(Long id){
        try{
            tipoPasajeroRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
