package com.fx21044.dto;

import java.util.Date;

import com.fx21044.model.UserDonation;

public class UserDonationDTO2 {		
	private Integer id;
	private String name;
	private Integer money;
	private Integer status;
	private String text;
	private Date createDate;
	private String username;
	private Integer donationId;
	
	public UserDonationDTO2() {
		
	}

	public UserDonationDTO2(Integer id, String name, Integer money, Integer status, String text, Date createDate,
			String username, Integer donationId) {
		this.id = id;
		this.name = name;
		this.money = money;
		this.status = status;
		this.text = text;
		this.createDate = createDate;
		this.username = username;
		this.donationId = donationId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getDonationId() {
		return donationId;
	}

	public void setDonationId(Integer donationId) {
		this.donationId = donationId;
	}
		
	
}
