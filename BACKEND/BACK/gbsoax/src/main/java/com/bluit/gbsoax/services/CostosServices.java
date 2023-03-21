package com.bluit.gbsoax.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.CostosModel;
import com.bluit.gbsoax.repositories.CostosRepository;

@Service
public class CostosServices {
    @Autowired
    CostosRepository costosRepository;

    public ArrayList<CostosModel> obtenerCosotos(){
        return (ArrayList<CostosModel>) costosRepository.findAll();
    }

    public CostosModel guardarCostos(CostosModel costo){
        return costosRepository.save(costo);
    }
}
