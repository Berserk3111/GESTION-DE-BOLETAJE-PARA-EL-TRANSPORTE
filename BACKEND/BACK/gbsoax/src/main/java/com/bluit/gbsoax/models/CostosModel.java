package com.bluit.gbsoax.models;

import javax.persistence.*;

@Entity
@Table(name= "costos")
public class CostosModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id_costo;
}
