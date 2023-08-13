package com.fx21044.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fx21044.dto.UserDTO;
import com.fx21044.model.Role;
import com.fx21044.model.User;
import com.fx21044.model.UserDonation;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private RoleDao roleDao;
	
	//Lấy danh sách user
	@Override
	public List<User> getUsers() {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<User> theQuery = currentSession.createQuery("from User order by userName", User.class);
		
		List<User> users = theQuery.getResultList();
		
		return users;
	}
	
	//Lưu user
	@Override
	public void saveUser(User user) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		currentSession.saveOrUpdate(user);
		
		currentSession.close();
	}
	
	//Tìm user bằng id
	@Override
	public User findUserByID(int id) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		User user = new User();
		
		try {
			user = currentSession.get(User.class, id);
		} finally {
			currentSession.close();
		} 
		
		return user;
	}
	
	//Cập nhật user
	@Override
	public void updateUser(UserDTO userDTO) {
		
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		currentSession.getTransaction().begin();
		
		User user = currentSession.get(User.class, userDTO.getId());
		
		if(user != null) {
			user.setFullName(userDTO.getFullName());
			user.setUserName(userDTO.getUserName());
			user.setAddress(userDTO.getAddress());
			user.setPhoneNumber(userDTO.getPhoneNumber());
			
			if(user.getRole().getId() != userDTO.getRoleId()) {
				Role role = roleDao.getRoleByID(userDTO.getRoleId());
				
				user.setRole(role);
			}

			currentSession.saveOrUpdate(user);
			
			currentSession.getTransaction().commit();
			currentSession.close();
		}
		
	}
	
	//Xóa user
	@Override
	public void deleteUser(int id) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		currentSession.getTransaction().begin();
		
		Query theQuery = currentSession.createQuery("delete from User where id=:userId");
		
		theQuery.setParameter("userId", id);
		
		theQuery.executeUpdate();
		
		currentSession.getTransaction().commit();
		currentSession.close();
	}
	
	//Xử lý khóa user
	@Override
	public void lockUser(UserDTO userDTO) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		User user = currentSession.get(User.class, userDTO.getId());
		
		currentSession.getTransaction().begin();
		
		if(user != null) {
			
			int status = user.getStatus() == 0 ? 1 : 0;
			
			user.setStatus(status);
			
			currentSession.saveOrUpdate(user);
		}
		
		currentSession.getTransaction().commit();
		currentSession.close();
		
	}
	
	//Tìm user bằng tên
	@SuppressWarnings("unchecked")
	@Override
	public User findUserByName(String userName) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		List<User> users = new ArrayList<User>();
		users = session.createQuery("from User where user_name=?")
					.setParameter(0, userName).list();
		if(users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	//Lấy danh sách quyên góp bằng donation id
	@SuppressWarnings("unchecked")
	@Override
	public List<UserDonation> getUserDonationsByDontaionId(int id) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		List<UserDonation> userDonations = new ArrayList<>();
		
		try {
			Query<UserDonation> theQuery = session.createQuery("from UserDonation ud where ud.donationId =:id");
			
			theQuery.setParameter("id", id);
			userDonations = theQuery.getResultList();
		} finally {
			session.close();
		}
		
		
		
		
		return userDonations;
	}

	

}
