package com.tragheit.airportManager.entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "lot")
@SuppressWarnings("serial")
public class Lot implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name = "lotnisko_id", referencedColumnName="id")
	private Lotnisko lotnisko_wylot;

	@Column(nullable = false)
	@ManyToOne
	@JoinColumn(name = "lotnisko_id", referencedColumnName="id")
	private Lotnisko lotnisko_przylot;

	@Column(nullable = false)
	private Date data_wylot;

	@ManyToOne
	@JoinColumn(name="samolot_id", referencedColumnName="id")
	@Column(nullable = false)
	private Samolot samolot;

	@Column(nullable = false)
	private double cena_bazowa;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Lotnisko getLotnisko_wylot() {
		return lotnisko_wylot;
	}

	public void setLotnisko_wylot(Lotnisko lotnisko_wylot) {
		this.lotnisko_wylot = lotnisko_wylot;
	}

	public Lotnisko getLotnisko_przylot() {
		return lotnisko_przylot;
	}

	public void setLotnisko_przylot(Lotnisko lotnisko_przylot) {
		this.lotnisko_przylot = lotnisko_przylot;
	}

	public Date getData_wylot() {
		return data_wylot;
	}

	public void setData_wylot(Date data_wylot) {
		this.data_wylot = data_wylot;
	}

	public Samolot getSamolot() {
		return samolot;
	}

	public void setSamolot(Samolot samolot) {
		this.samolot = samolot;
	}

	public double getCena_bazowa() {
		return cena_bazowa;
	}

	public void setCena_bazowa(double cena_bazowa) {
		this.cena_bazowa = cena_bazowa;
	}

	@Override
	public String toString() {
		return "Lot [id=" + id + ", lotnisko_wylot=" + lotnisko_wylot + ", lotnisko_przylot=" + lotnisko_przylot
				+ ", data_wylot=" + data_wylot + ", samolot=" + samolot + ", cena_bazowa=" + cena_bazowa + "]";
	}
}
