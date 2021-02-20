package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "bilet")
@SuppressWarnings("serial")
public class Bilet implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="pasazer_id", referencedColumnName="id")
	private Pasazer pasazer;

	@Column(nullable = false)
	@OneToMany
	@JoinColumn(name="bagaz_id", referencedColumnName="id")
	private Bagaz bagaz;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="lot_id", referencedColumnName="id")
	private Lot lot;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="miejsce_samolot_id", referencedColumnName="id")
	private MiejsceSamolot miejsce;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name="bilet_status_id", referencedColumnName="id")
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
