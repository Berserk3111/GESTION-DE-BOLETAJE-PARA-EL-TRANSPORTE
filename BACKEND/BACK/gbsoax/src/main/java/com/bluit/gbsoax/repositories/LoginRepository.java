package com.bluit.gbsoax.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.bluit.gbsoax.models.LoginModel;

@Repository
public interface LoginRepository extends CrudRepository<LoginModel, Long> {

    @Query(value = "select l from LoginModel l where email = :email")
    Optional<LoginModel> findOneByEmail(@Param("email") String email);
}
