package com.fx21044.dto;

import java.util.Date;
import java.util.List;

import com.fx21044.model.Donation;
import com.fx21044.model.User;

public class DonationDTO {
	
	public DonationDTO(Donation donation) {
		id = donation.getId();
		code = donation.getCode();
		description = donation.getDescription();
		money = donation.getMoney();
		name = donation.getName();
		organizationName = donation.getOrganizationName();
		phoneNumber = donation.getPhoneNumber();
		startDate = donation.getStartDate();
		endDate = donation.getEndDate();
		status = donation.getStatus();
		createdAt = donation.getCreateAt();
		users = donation.getUsers();
	}
	
	private Integer id;
	private String code;
	private String description;
	private Integer money;
	private String name;
	private String organizationName;
	private String phoneNumber;
	private String startDate;
	private String endDate;
	private Integer status;
	private Date createdAt;
	private List<User> users;
	
	public DonationDTO() {
		
	}
	
	public DonationDTO(Integer id, String code, String description, Integer money, String name, String organizationName,
			String phoneNumber, String startDate, String endDate, Integer status, Date createdAt, List<User> users) {
		this.id = id;
		this.code = code;
		this.description = description;
		this.money = money;
		this.name = name;
		this.organizationName = organizationName;
		this.phoneNumber = phoneNumber;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.createdAt = createdAt;
		this.users = users;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getMoney() {
		return money;
	}
	public void setMoney(Integer money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "DonationDTO [id=" + id + ", code=" + code + ", description=" + description + ", money=" + money
				+ ", name=" + name + ", organizationName=" + organizationName + ", phoneNumber=" + phoneNumber
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + ", createdAt="
				+ createdAt + ", users=" + users + "]";
	}
}
