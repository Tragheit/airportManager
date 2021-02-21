package com.tragheit.airportManager.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bilet")
public class Bilet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@ManyToOne
	@JoinColumn(name="pasazer")
	private Pasazer pasazer;

	@OneToOne
	@JoinColumn(name="bagaz")
	private Bagaz bagaz;

	@ManyToOne
	@JoinColumn(name="lot")
	private Lot lot;

	@ManyToOne
	@JoinColumn(name="miejsce_samolot")
	private MiejsceSamolot miejsce;

	@ManyToOne
	@JoinColumn(name="bilet_status")
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
