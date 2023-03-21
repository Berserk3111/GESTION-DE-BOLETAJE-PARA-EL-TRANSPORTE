package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.TipoPaqueteModel;

@Repository
public interface TipoPaqueteRepository extends CrudRepository<TipoPaqueteModel, Long> {
    
}
