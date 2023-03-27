package com.bluit.gbsoax.controllers;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bluit.gbsoax.models.LoginModel;
import com.bluit.gbsoax.services.LoginServices;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Autowired
    LoginServices loginServices;

    @GetMapping()
    public ArrayList<LoginModel> obtenerLogin(){
        return loginServices.obtenerLogin();
    }

    @PostMapping()
    public LoginModel guardarLogin(LoginModel login){
        return this.loginServices.guardarLogin(login);
    }

    @GetMapping(path = "/{id}")
    public Optional<LoginModel> obtenerPorid(@PathVariable("id") Long id){
        return this.loginServices.obtenerPorId(id);
    }

    @DeleteMapping(path = "/{id}")
    public String eliminarUsuario(@PathVariable("id") long id){
        boolean ok = this.loginServices.eliminarLogin(id);
        if(ok){
            return "eliminado" + id;
        }else{
            return "No se pudo eliminar" + id;
        }
    }

    @PostMapping("/iniciarSesion/")
    public ArrayList<LoginModel> login(@RequestHeader String email, @RequestHeader String password){
        return loginServices.login(email, password);
    }
}
