package com.tragheit.airportManager.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tragheit.airportManager.model.Samolot;
import com.tragheit.airportManager.repository.SamolotRepository;

@Service
public class SamolotService {

	@Autowired
    SamolotRepository<Samolot> samolotRepository;
    
    @Transactional
    public List<Samolot> getAllPlanes(){
    	System.out.print(samolotRepository.findAll());
    	return samolotRepository.findAll();
    }
    
    @Transactional
	public Optional<Samolot> getById(Long id) {
    	System.out.print(samolotRepository.findById(id));
		return samolotRepository.findById(id);
	}
}