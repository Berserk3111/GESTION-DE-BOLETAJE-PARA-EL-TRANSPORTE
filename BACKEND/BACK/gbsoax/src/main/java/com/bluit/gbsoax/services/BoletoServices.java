package com.bluit.gbsoax.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.BoletoModel;
import com.bluit.gbsoax.repositories.BoletoRepository;

@Service
public class BoletoServices {
    @Autowired
    BoletoRepository boletoRepository;

    public ArrayList<BoletoModel> obtenerBoletos(){
        return (ArrayList<BoletoModel>) boletoRepository.findAll();
    }

    public BoletoModel guardarBoleto(BoletoModel boleto){
        return boletoRepository.save(boleto);
    }
}
