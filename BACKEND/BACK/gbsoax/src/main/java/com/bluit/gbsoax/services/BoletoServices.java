package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

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

    public Optional<BoletoModel> obtenerPorId(Long id){
        return boletoRepository.findById(id);
    }

    public boolean eliminarBoleto(Long id){
        try{
            boletoRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
