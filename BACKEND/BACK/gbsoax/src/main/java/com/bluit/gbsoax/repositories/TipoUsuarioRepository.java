package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.TipoUsuarioModel;

@Repository
public interface TipoUsuarioRepository extends CrudRepository<TipoUsuarioModel, Long > {
    
}
