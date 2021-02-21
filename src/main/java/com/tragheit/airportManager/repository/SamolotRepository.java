package com.tragheit.airportManager.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tragheit.airportManager.model.Samolot;

@Repository
public interface SamolotRepository<S> extends CrudRepository<Samolot, Long>{
	
	List<Samolot> findAll();
	
	Samolot findById(long id);
	
}
