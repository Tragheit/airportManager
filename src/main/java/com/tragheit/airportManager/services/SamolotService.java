package com.tragheit.airportManager.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

import com.tragheit.airportManager.entities.Samolot;
import com.tragheit.airportManager.repositories.SamolotRepository;

@RestController
@RequestMapping("/api")
public class SamolotService {

    @Autowired
    SamolotRepository samolotRepository;
    

    //Get All Samoloty
    @GetMapping("/samoloty")
    public List<Samolot> getAllNotes() {
        return samolotRepository.findAll();
    }

}