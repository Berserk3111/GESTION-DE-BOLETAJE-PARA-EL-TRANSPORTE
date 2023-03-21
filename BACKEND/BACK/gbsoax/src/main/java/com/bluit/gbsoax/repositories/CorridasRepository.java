package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.CorridasModel;

@Repository
public interface CorridasRepository extends CrudRepository<CorridasModel, Long> {
    
}
