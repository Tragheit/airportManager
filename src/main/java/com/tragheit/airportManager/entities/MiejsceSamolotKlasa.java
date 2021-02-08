package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "miejsce_samolot_klasa")
@SuppressWarnings("serial")
public class MiejsceSamolotKlasa implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private String nazwa;

	@Column(nullable = false)
	private double mnoznik_cena;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public double getMnoznik_cena() {
		return mnoznik_cena;
	}

	public void setMnoznik_cena(double mnoznik_cena) {
		this.mnoznik_cena = mnoznik_cena;
	}

	@Override
	public String toString() {
		return "MiejsceSamolotKlasa [id=" + id + ", nazwa=" + nazwa + ", mnoznik_cena=" + mnoznik_cena + "]";
	}
}
