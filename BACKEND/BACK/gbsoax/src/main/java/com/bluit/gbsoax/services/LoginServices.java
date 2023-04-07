package com.bluit.gbsoax.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.bluit.gbsoax.models.LoginModel;
import com.bluit.gbsoax.repositories.LoginRepository;

@Service
public class LoginServices {
  @Autowired
  LoginRepository loginRepository;

  public ArrayList<LoginModel> obtenerLogin() {
    return (ArrayList<LoginModel>) loginRepository.findAll();
  }

  public LoginModel guardarLogin(LoginModel login) {
    return loginRepository.save(login);
  }

  public Optional<LoginModel> obtenerPorId(Long id) {
    return loginRepository.findById(id);
  }

  public boolean eliminarLogin(Long id) {
    try {
      loginRepository.deleteById(id);
      return true;
    } catch (Exception err) {
      return false;
    }
  }

  public ArrayList<LoginModel> login(String email, String password) {
    ArrayList<LoginModel> clientes = (ArrayList<LoginModel>) loginRepository.findAll();
    ArrayList<LoginModel> cliente = new ArrayList<>();
    for (LoginModel c : clientes) {
      if (c.getEmail().equals(email) && BCrypt.checkpw(password, c.getPassword())) {
        cliente.add(c);
      } else {
        continue;
      }
    }
    return cliente;
  }

  public Optional<LoginModel> prueba(String email) {
    return loginRepository.findOneByEmail(email);
  }

}
