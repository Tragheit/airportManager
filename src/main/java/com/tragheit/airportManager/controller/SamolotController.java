package com.tragheit.airportManager.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tragheit.airportManager.model.Samolot;
import com.tragheit.airportManager.service.SamolotService;

@RestController
@RequestMapping("/api")
public class SamolotController {

    @Autowired
    SamolotService samolotService;    

    @RequestMapping(value = "/plane", method = RequestMethod.GET)
	public List<Samolot> getAll() {
		return samolotService.getAllPlanes();
	}
    
    @RequestMapping(value = "/plane/{id}", method = RequestMethod.GET)
	public @ResponseBody Optional<Samolot> getAllUsers(@PathVariable Long id) {
		return samolotService.getById(id);
	}

}