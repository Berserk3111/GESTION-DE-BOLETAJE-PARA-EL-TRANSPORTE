package com.bluit.gbsoax.services;
import java.util.ArrayList;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bluit.gbsoax.models.UsuarioModel;
import com.bluit.gbsoax.repositories.UsuarioRepository;

@Service
public class UsuarioServices {
    //Llamado a el repository
    @Autowired
    UsuarioRepository usuarioRepository;
    //Funcion de obtener usuarios
    public ArrayList<UsuarioModel> obtenerUsuarios(){
        return (ArrayList<UsuarioModel>) usuarioRepository.findAll();
    }
    //Funcion guardar usuario
    public UsuarioModel guardarUsuario(UsuarioModel usuario){
        return usuarioRepository.save(usuario);
    }
    //Funcion obtener por ID
    public Optional<UsuarioModel> obtenerPorId(Long id){
        return usuarioRepository.findById(id);
    }
    //Funcion eliminar usuario
    public boolean eliminarUsuario(Long id){
        try{
            usuarioRepository.deleteById(id);
            return true;
        }catch(Exception err){
            return false;
        }
    }
}
