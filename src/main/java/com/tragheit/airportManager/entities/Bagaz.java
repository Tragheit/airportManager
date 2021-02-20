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
@Table(name = "bagaz")
@SuppressWarnings("serial")
public class Bagaz implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="bagaz_rodzaj_id", referencedColumnName="id")
	private BagazRodzaj rodzaj;

	@Column(nullable = false)
	private double waga;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public BagazRodzaj getRodzaj() {
		return rodzaj;
	}

	public void setRodzaj(BagazRodzaj rodzaj) {
		this.rodzaj = rodzaj;
	}

	public double getWaga() {
		return waga;
	}

	public void setWaga(double waga) {
		this.waga = waga;
	}

	@Override
	public String toString() {
		return "Bagaz [id=" + id + ", rodzaj=" + rodzaj + ", waga=" + waga + "]";
	}
}
