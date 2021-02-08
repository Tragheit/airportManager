package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lotnisko")
@SuppressWarnings("serial")
public class Lotnisko implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private String nazwa;

	@Column(nullable = false)
	private String miasto;

	@Column(nullable = false)
	private String kraj;

	@Column(nullable = false)
	private String kontynent;

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

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public String getKraj() {
		return kraj;
	}

	public void setKraj(String kraj) {
		this.kraj = kraj;
	}

	public String getKontynent() {
		return kontynent;
	}

	public void setKontynent(String kontynent) {
		this.kontynent = kontynent;
	}

	@Override
	public String toString() {
		return "Lotnisko [id=" + id + ", nazwa=" + nazwa + ", miasto=" + miasto + ", kraj=" + kraj + ", kontynent="
				+ kontynent + "]";
	}
}
