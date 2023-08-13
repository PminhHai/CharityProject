package com.fx21044.dto;

import java.util.Date;

import com.fx21044.model.UserDonation;

public class UserDonationDTO {
	
	public UserDonationDTO(UserDonation userDonation) {
		id = userDonation.getId();
		name = userDonation.getName();
		money = userDonation.getMoney();
		status = userDonation.getStatus();
		text = userDonation.getText();
		createDate = userDonation.getCreatedDate();
		userId = userDonation.getUserId();
		donationId = userDonation.getDonationId();
	}
		
	private Integer id;
	private String name;
	private Integer money;
	private Integer status;
	private String text;
	private Date createDate;
	private Integer userId;
	private Integer donationId;
		
	public UserDonationDTO() {
		
	}
	
	public UserDonationDTO(Integer id, String name, Integer money, Integer status, String text, Date createDate,
			Integer userId, Integer donationId) {
		this.id = id;
		this.name = name;
		this.money = money;
		this.status = status;
		this.text = text;
		this.createDate = createDate;
		this.userId = userId;
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
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getDonationId() {
		return donationId;
	}
	public void setDonationId(Integer donationId) {
		this.donationId = donationId;
	}

	@Override
	public String toString() {
		return "UserDonationDTO [id=" + id + ", name=" + name + ", money=" + money + ", status=" + status + ", text="
				+ text + ", createDate=" + createDate + ", userId=" + userId + ", donationId=" + donationId + "]";
	}
	
}
