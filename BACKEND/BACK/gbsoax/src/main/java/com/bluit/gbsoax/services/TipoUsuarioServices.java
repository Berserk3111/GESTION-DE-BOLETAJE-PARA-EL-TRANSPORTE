package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.TipoUsuarioModel;
import com.bluit.gbsoax.repositories.TipoUsuarioRepository;

@Service
public class TipoUsuarioServices {
    @Autowired
    TipoUsuarioRepository tipoUsuarioRepository;

    public ArrayList<TipoUsuarioModel> obtenerTipoUsuarios(){
        return (ArrayList<TipoUsuarioModel>) tipoUsuarioRepository.findAll();
    }

    public TipoUsuarioModel guardarTipoUsuario(TipoUsuarioModel Tusuario){
        return tipoUsuarioRepository.save(Tusuario);
    }

    public Optional<TipoUsuarioModel> obtenerPorId(Long id){
        return tipoUsuarioRepository.findById(id);
    }

    public boolean eliminarTipoUsuario(Long id){
        try{
            tipoUsuarioRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
