package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "miejsce_samolot")
@SuppressWarnings("serial")
public class MiejsceSamolot implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="samolot_id", referencedColumnName="id")
	private Samolot samolot;

	@Column(nullable = false)
	private String nazwa;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="miejsce_samolot_klasa_id", referencedColumnName="id")
	private int klasa;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="miejsce_samolot_rodzaj_id", referencedColumnName="id")
	private int rodzaj;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Samolot getSamolot() {
		return samolot;
	}

	public void setSamolot(Samolot samolot) {
		this.samolot = samolot;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public int getKlasa() {
		return klasa;
	}

	public void setKlasa(int klasa) {
		this.klasa = klasa;
	}

	public int getRodzaj() {
		return rodzaj;
	}

	public void setRodzaj(int rodzaj) {
		this.rodzaj = rodzaj;
	}

	@Override
	public String toString() {
		return "SamolotMiejsce [id=" + id + ", samolot=" + samolot + ", nazwa=" + nazwa + ", klasa=" + klasa
				+ ", rodzaj=" + rodzaj + "]";
	}
}
