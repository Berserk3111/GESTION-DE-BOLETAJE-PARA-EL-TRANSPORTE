package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.PaqueteriaModel;

@Repository
public interface PaqueteriaRepoitory extends CrudRepository<PaqueteriaModel, Long> {
    
}
