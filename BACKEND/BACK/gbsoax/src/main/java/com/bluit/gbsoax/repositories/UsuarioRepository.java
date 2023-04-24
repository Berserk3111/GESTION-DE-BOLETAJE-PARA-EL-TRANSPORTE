package com.bluit.gbsoax.repositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.bluit.gbsoax.models.UsuarioModel;

@Repository
//Se le agrega a el modelo el Crud convirtiendolo en una interfaz
public interface UsuarioRepository extends CrudRepository<UsuarioModel, Long> {
}
