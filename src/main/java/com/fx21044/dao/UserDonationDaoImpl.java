package com.fx21044.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fx21044.dto.UserDonationDTO;
import com.fx21044.model.Donation;
import com.fx21044.model.Role;
import com.fx21044.model.UserDonation;

@Repository
public class UserDonationDaoImpl implements UserDonationDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private DonationDao donationDao;
	
	//Lưu quyên góp
	@Override
	public void saveUserDonation(UserDonation userDonation) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		currentSession.saveOrUpdate(userDonation);
		
		currentSession.close();
	}

	//Chuyển trạng thái quyên góp
	@Override
	public void changeStatusUserDonation(int id, int status) {
		Session currentSession = sessionFactory.getSessionFactory().openSession();
		
		currentSession.getTransaction().begin();
		
		UserDonation userDonation = currentSession.get(UserDonation.class, id);
		
		if(userDonation != null) {
			userDonation.setStatus(status);
			currentSession.saveOrUpdate(userDonation);
			
			currentSession.getTransaction().commit();
			currentSession.close();
		}
	}

	//Tìm quyên góp bằng id
	@Override
	public UserDonation findUserDonationByID(int id) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		UserDonation theUserDonation = new UserDonation();
		
		try {
			theUserDonation = session.get(UserDonation.class, id);
		} finally {
			session.close();
		}
		
		return theUserDonation;
	}

	//Lấy danh sách quyên góp bằng status
	@Override
	public List<UserDonation> getListUserDonationsByStatus(int donationId, int status) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		List<UserDonation> userDonations = new ArrayList<>();
		
		try {
			String hql = "from UserDonation ud where ud.donationId =:id and ud.status =:status";
			
			Query<UserDonation> theQuery = session.createQuery(hql, UserDonation.class);
			theQuery.setParameter("id", donationId);
			theQuery.setParameter("status", status);
			
			userDonations = theQuery.getResultList();
		} finally {
			session.close();
		}
		
		return userDonations;
	}


	
	
}
