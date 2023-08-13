package com.fx21044.dto;

import java.util.Date;

import com.fx21044.model.User;



public class UserDTO {
	
	public UserDTO(User user) {
		id = user.getId();
		userName = user.getUserName();
		password = user.getPassword();
		fullName = user.getFullName();
		email = user.getEmail();
		address = user.getAddress();
		phoneNumber = user.getPhoneNumber();
		note = user.getNote();
		status = user.getStatus();
		roleId = user.getRole().getId();
		roleName = user.getRole().getRoleName();
		createdAt = user.getCreatedAt();
	}
	
	private Integer id;
	private String userName;
	private String password;
	private String fullName;
	private String email;
	private String address;
	private String phoneNumber;
	private String note;
	private Integer status;
	private Integer roleId;
	private String roleName;
	private Date createdAt;
	
	public UserDTO() {
		
	}

	public UserDTO(int id, String userName, String password, String fullName, String email, String address,
			String phoneNumber, String note, Integer status, Integer roleId, String roleName, Date createdAt) {
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.note = note;
		this.status = status;
		this.roleId = roleId;
		this.roleName = roleName;
		this.createdAt = createdAt;
	}



	public Integer getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", userName=" + userName + ", password=" + password + ", fullName=" + fullName
				+ ", email=" + email + ", address=" + address + ", phoneNumber=" + phoneNumber + ", note=" + note
				+ ", status=" + status + ", roleId=" + roleId + ", roleName=" + roleName + ", createdAt=" + createdAt
				+ "]";
	}
	
	
}
