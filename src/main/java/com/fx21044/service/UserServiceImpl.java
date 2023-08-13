package com.fx21044.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fx21044.dao.RoleDao;
import com.fx21044.dao.UserDao;
import com.fx21044.dto.UserDTO;
import com.fx21044.model.Role;
import com.fx21044.model.User;
import com.fx21044.model.UserDonation;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	//Lấy danh sách user
	@Override
	@Transactional
	public List<User> getUsers() {
		return userDao.getUsers();
	}
	
	//Lưu user
	@Override
	@Transactional
	public void saveUser(UserDTO user) {
		Role role = roleDao.getRoleByID(user.getRoleId());
		
		User theUser = new User();
		theUser.setFullName(user.getFullName());
		theUser.setPassword(user.getPassword());
		theUser.setUserName(user.getUserName());
		theUser.setEmail(user.getEmail());
		theUser.setAddress(user.getAddress());
		theUser.setPhoneNumber(user.getPhoneNumber());
		theUser.setRole(role);
		
		userDao.saveUser(theUser);
	}
	
	//Cập nhật user
	@Override
	@Transactional
	public void updateUser(UserDTO userDTO) {
		userDao.updateUser(userDTO);	
	}
	
	//Xóa user
	@Override
	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);
		
	}
	
	//Khóa user
	@Override
	@Transactional
	public void lockUser(UserDTO userDTO) {
		userDao.lockUser(userDTO);
	}
	
	//Xử lý đăng nhập
	@Override
	@Transactional
	public User checkLogin(String userName, String password) {
		User user = userDao.findUserByName(userName);
		
		if(user != null && user.getPassword().equals(password)) {
			return user;
		} else {
			return null;
		}
		
		
	}
	
	//Tìm user bằng tên
	@Override
	public User findUserByUserName(String userName) {
		return userDao.findUserByName(userName);
	}
	
	//Lấy danh sách quyên góp bằng donation id
	@Override
	public List<UserDonation> getUserDonationsByDonationID(int id) {
		
		return userDao.getUserDonationsByDontaionId(id);
	}
	
	//Tìm user bằng id
	@Override
	public User findUserById(int id) {
		return userDao.findUserByID(id);
	}

	

}
