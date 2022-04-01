package com.tragheit.airportManager.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.tragheit.airportManager.entities.Samolot;

public interface SamolotRepository extends JpaRepository<Samolot, Long>{
	List<Samolot> findAll();
}
