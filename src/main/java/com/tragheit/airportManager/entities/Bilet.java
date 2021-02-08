package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bilet")
@SuppressWarnings("serial")
public class Bilet implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private Pasazer pasazer;

	@Column(nullable = false)
	private Bagaz bagaz;

	@Column(nullable = false)
	private Lot lot;

	@Column(nullable = false)
	private MiejsceSamolot miejsce;

	@Column(nullable = false)
	private BiletStatus status;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Pasazer getPasazer() {
		return pasazer;
	}

	public void setPasazer(Pasazer pasazer) {
		this.pasazer = pasazer;
	}

	public Bagaz getBagaz() {
		return bagaz;
	}

	public void setBagaz(Bagaz bagaz) {
		this.bagaz = bagaz;
	}

	public Lot getLot() {
		return lot;
	}

	public void setLot(Lot lot) {
		this.lot = lot;
	}

	public MiejsceSamolot getMiejsce() {
		return miejsce;
	}

	public void setMiejsce(MiejsceSamolot miejsce) {
		this.miejsce = miejsce;
	}

	public BiletStatus getStatus() {
		return status;
	}

	public void setStatus(BiletStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Bilet [id=" + id + ", pasazer=" + pasazer + ", bagaz=" + bagaz + ", lot=" + lot + ", miejsce=" + miejsce
				+ ", status=" + status + "]";
	}
}
