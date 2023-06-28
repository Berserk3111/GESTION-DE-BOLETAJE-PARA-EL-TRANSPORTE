package com.bluit.gbsoax.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.BoletoModel;

@Repository
public interface BoletoRepository extends JpaRepository<BoletoModel, Long> {
    
}
