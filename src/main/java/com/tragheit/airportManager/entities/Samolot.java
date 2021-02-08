package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "samolot")
@SuppressWarnings("serial")
public class Samolot implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private String marka;

	@Column(nullable = false)
	private String model;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMarka() {
		return marka;
	}

	public void setMarka(String marka) {
		this.marka = marka;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Override
	public String toString() {
		return "Samolot [id=" + id + ", marka=" + marka + ", model=" + model + "]";
	}
}
