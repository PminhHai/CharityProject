package com.fx21044.service;

import java.util.List;
import java.util.Optional;

import com.fx21044.dto.UserDTO;
import com.fx21044.model.User;
import com.fx21044.model.UserDonation;

public interface UserService {
	public List<User> getUsers();
	
	public void saveUser(UserDTO user);
	
	public void updateUser(UserDTO userDTO);
	
	public void deleteUser(int id);
	
	public void lockUser(UserDTO userDTO);
	
	public User checkLogin(String userName, String password);
	
	public User findUserByUserName(String userName);
	
	public List<UserDonation> getUserDonationsByDonationID(int id);
	
	public User findUserById(int id);
}
