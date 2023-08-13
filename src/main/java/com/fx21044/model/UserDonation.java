package com.fx21044.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "user_donation")
public class UserDonation {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "money")
	private int money;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "text")
	private String text;
	
	@Column(name = "created")
	@CreationTimestamp
	private Date createdDate;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "donation_id")
	private int donationId;

	public UserDonation() {
		
	}

	public UserDonation(int id, String name, int money, int status, String text, Date createdDate, int userId,
			int donationId) {
		this.id = id;
		this.name = name;
		this.money = money;
		this.status = status;
		this.text = text;
		this.createdDate = createdDate;
		this.userId = userId;
		this.donationId = donationId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDonationId() {
		return donationId;
	}

	public void setDonationId(int donationId) {
		this.donationId = donationId;
	}
	
	
}
