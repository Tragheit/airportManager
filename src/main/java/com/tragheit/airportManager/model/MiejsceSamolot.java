package com.tragheit.airportManager.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "miejsce_samolot")
public class MiejsceSamolot {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@ManyToOne
	@JoinColumn(name="samolot")
	private Samolot samolot;

	@Column(nullable = false)
	private String nazwa;

	@ManyToOne
	@JoinColumn(name="miejsce_samolot_klasa")
	private MiejsceSamolotKlasa klasa;

	@ManyToOne
	@JoinColumn(name="miejsce_samolot_rodzaj")
	private MiejsceSamolotRodzaj rodzaj;

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

	public MiejsceSamolotKlasa getKlasa() {
		return klasa;
	}

	public void setKlasa(MiejsceSamolotKlasa klasa) {
		this.klasa = klasa;
	}

	public MiejsceSamolotRodzaj getRodzaj() {
		return rodzaj;
	}

	public void setRodzaj(MiejsceSamolotRodzaj rodzaj) {
		this.rodzaj = rodzaj;
	}

	@Override
	public String toString() {
		return "SamolotMiejsce [id=" + id + ", samolot=" + samolot + ", nazwa=" + nazwa + ", klasa=" + klasa
				+ ", rodzaj=" + rodzaj + "]";
	}
}
