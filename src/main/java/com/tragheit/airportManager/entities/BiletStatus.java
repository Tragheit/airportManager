package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bilet_status")
@SuppressWarnings("serial")
public class BiletStatus implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private String nazwa;

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

	@Override
	public String toString() {
		return "BiletStatus [id=" + id + ", nazwa=" + nazwa + "]";
	}
}
