package com.fx21044.dto;

import java.util.Date;

import com.fx21044.model.User;

public class SignUpPageDTO extends UserDTO{
	
	private String matchingPassword;

	public SignUpPageDTO() {
		super();

	}

	public SignUpPageDTO(int id, String userName, String password, String fullName, String email, String address,
			String phoneNumber, String note, Integer status, Integer roleId, String roleName, Date createdAt) {
		super(id, userName, password, fullName, email, address, phoneNumber, note, status, roleId, roleName, createdAt);

	}

	public SignUpPageDTO(User user) {
		super(user);
		
	}

	public String getMatchingPassword() {
		return matchingPassword;
	}

	public void setMatchingPassword(String matchingPassword) {
		this.matchingPassword = matchingPassword;
	}
	
	

}
