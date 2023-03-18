package com.bluit.gbsoax.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public LoginModel guardarLogin(@RequestBody LoginModel login){
        return this.loginServices.guardarLogin(login);
    }
}
