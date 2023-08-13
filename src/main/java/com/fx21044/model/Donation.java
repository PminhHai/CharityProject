package com.fx21044.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "donation")
public class Donation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "money")
	private int money;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "organization_name")
	private String organizationName;
	
	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "start_date")
	private String startDate;
	
	@Column(name = "end_date")
	private String endDate;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "created")
	@CreationTimestamp
	private Date createAt; 
	
	@ManyToMany(
			fetch = FetchType.LAZY,
			cascade = {CascadeType.PERSIST,CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH})
	@JoinTable(
			name = "user_donation",
			joinColumns = @JoinColumn(name = "donation_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;
	
	public Donation() {
		
	}

	public Donation(int id, String code, String description, int money, String name, String organizationName,
			String phoneNumber, String startDate, String endDate, int status, Date createAt, List<User> users) {
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
		this.createAt = createAt;
		this.users = users;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
