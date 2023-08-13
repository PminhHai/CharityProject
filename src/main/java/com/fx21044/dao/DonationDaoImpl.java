package com.fx21044.dao;

import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fx21044.dto.DonationDTO;
import com.fx21044.model.Donation;

@Repository
public class DonationDaoImpl implements DonationDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	//Lấy danh sách quyên góp
	@Override
	public List<Donation> getDonations() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Donation> theQuery = session.createQuery("from Donation", Donation.class);
		
		List<Donation> donations = theQuery.getResultList();
		
		return donations;
	}
	
	//Lưu đợt quyên góp
	@Override
	public void saveDonation(Donation donation) {
		
		Session session = sessionFactory.getSessionFactory().openSession();	
		session.saveOrUpdate(donation);
		session.close();;
	}
	
	//Cập nhật quyên góp
	@Override
	public void updateDonation(DonationDTO donationDTO) {
		
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Donation donation = session.get(Donation.class, donationDTO.getId());
		
		
		if(donation != null)
		{
			donation.setCode(donationDTO.getCode());
			donation.setDescription(donationDTO.getDescription());
			donation.setName(donationDTO.getName());
			donation.setOrganizationName(donationDTO.getOrganizationName());
			donation.setStartDate(donationDTO.getStartDate());
			donation.setEndDate(donationDTO.getEndDate());
			donation.setPhoneNumber(donationDTO.getPhoneNumber());
			
			session.saveOrUpdate(donation);
			
			session.getTransaction().commit();
			session.close();
		}
		
	}
	
	//Xóa quyên góp
	@Override
	public void deleteDonation(int id) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Query theQuery = session.createQuery("delete from Donation where id=:donationId");
		
		theQuery.setParameter("donationId", id);
		
		theQuery.executeUpdate();
		
		session.getTransaction().commit();
		
		session.close();
	}
	
	//Chuyển trạng thái đang quyên góp
	@Override
	public void donatingDonation(DonationDTO donationDTO) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Donation donation = session.get(Donation.class, donationDTO.getId());
		
		if(donation != null) {
			donation.setStatus(1);
			
			session.saveOrUpdate(donation);
			session.getTransaction().commit();
			session.close();
		}
		
	}
	
	//Chuyển trạng thái kết thúc quyên góp
	@Override
	public void endDonation(DonationDTO donationDTO) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Donation donation = session.get(Donation.class, donationDTO.getId());
		
		if(donation != null) {
			donation.setStatus(2);
			
			session.saveOrUpdate(donation);
			session.getTransaction().commit();
			session.close();
		}
		
	}
	
	//Chuyển trạng thái đóng quyên góp
	@Override
	public void closeDonation(DonationDTO donationDTO) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Donation donation = session.get(Donation.class, donationDTO.getId());
		
		if(donation != null) {
			donation.setStatus(3);
			
			session.saveOrUpdate(donation);
			session.getTransaction().commit();
			session.close();
		}
		
	}
	
	//Tìm donation bằng id
	@Override
	public Optional<Donation> findDonationByID(int id) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		Query<Donation> theQuery = session.createQuery("from Donation", Donation.class);
		
		List<Donation> donations = theQuery.getResultList();
		
		for(Donation donation : donations) {
			if(donation.getId() == id) {
				return Optional.ofNullable(donation);
			}
		}
		return Optional.empty();
	}
	
	//Phân trang donation
	@Override
	@SuppressWarnings("unchecked")
	public List<Donation> findDonationsPage(Integer offset, Integer maxResult) {
		return sessionFactory.openSession()
				.createCriteria(Donation.class)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResult!=null?maxResult:5)
				.list();
	}

	@Override
	public Long count() {
		return (Long)sessionFactory.openSession()
				.createCriteria(Donation.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
	}
	
	//Xử lý thêm tiền vào donation sao khi xác nhận
	@Override
	public void updateDonationMoney(int id, int money) {
		Session session = sessionFactory.getSessionFactory().openSession();
		
		session.getTransaction().begin();
		
		Donation donation = session.get(Donation.class, id);
		
		if(donation != null) {
			donation.setMoney(donation.getMoney() + money);
			
			session.saveOrUpdate(donation);
			session.getTransaction().commit();
			session.close();
		}
		
	}
}
