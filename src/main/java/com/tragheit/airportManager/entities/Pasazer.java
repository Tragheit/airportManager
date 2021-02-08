package com.tragheit.airportManager.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pasazer")
@SuppressWarnings("serial")
public class Pasazer implements Serializable {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false)
	private String imie;

	@Column(nullable = false)
	private String nazwisko;

	@Column(nullable = false)
	private String email;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Pasazer [id=" + id + ", imie=" + imie + ", nazwisko=" + nazwisko + ", email=" + email + "]";
	}
}
