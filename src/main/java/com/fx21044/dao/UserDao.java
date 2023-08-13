package com.fx21044.dao;

import java.util.List;
import java.util.Optional;

import com.fx21044.dto.UserDTO;
import com.fx21044.model.User;
import com.fx21044.model.UserDonation;

public interface UserDao {
	public List<User> getUsers();
	
	public void saveUser(User user);
	
	public void updateUser(UserDTO user);
	
	public User findUserByID(int id);
	
	public void deleteUser(int id);
	
	public void lockUser(UserDTO userDTO);
	
	public User findUserByName(String userName);
	
	public List<UserDonation> getUserDonationsByDontaionId(int id);
}
