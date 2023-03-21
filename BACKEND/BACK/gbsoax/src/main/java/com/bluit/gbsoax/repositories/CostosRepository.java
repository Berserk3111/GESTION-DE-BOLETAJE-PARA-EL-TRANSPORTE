package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.CostosModel;

@Repository
public interface CostosRepository extends CrudRepository<CostosModel,Long> {
    
}
