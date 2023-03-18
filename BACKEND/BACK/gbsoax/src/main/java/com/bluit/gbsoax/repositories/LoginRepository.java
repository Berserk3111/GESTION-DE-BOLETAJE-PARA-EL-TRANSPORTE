package com.bluit.gbsoax.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bluit.gbsoax.models.LoginModel;

@Repository
public interface LoginRepository extends CrudRepository<LoginModel, Long> {
    
}
