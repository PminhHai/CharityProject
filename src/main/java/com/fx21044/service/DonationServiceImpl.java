package com.fx21044.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fx21044.dao.DonationDao;
import com.fx21044.dto.DonationDTO;
import com.fx21044.model.Donation;

@Service
public class DonationServiceImpl implements DonationService{

	@Autowired
	private DonationDao donationDao;
	
	//Lấy danh sách donation
	@Override
	@Transactional
	public List<Donation> getDonations() {
		
		return donationDao.getDonations();
	}
	
	//Lưu donation
	@Override
	@Transactional
	public void saveDonation(DonationDTO donationDTO) {
		Donation donation = new Donation();
		
		donation.setCode(donationDTO.getCode());
		donation.setDescription(donationDTO.getDescription());
		donation.setName(donationDTO.getName());
		donation.setOrganizationName(donationDTO.getOrganizationName());
		donation.setStartDate(donationDTO.getStartDate());
		donation.setEndDate(donationDTO.getEndDate());
		donation.setPhoneNumber(donationDTO.getPhoneNumber());
		
		donationDao.saveDonation(donation);
	}
	
	//Cập nhật donation
	@Override
	@Transactional
	public void updateDonation(DonationDTO donationDTO) {
		donationDao.updateDonation(donationDTO);	
	}
	
	//Xóa donation
	@Override
	@Transactional
	public void deleteDonation(int id) {
		donationDao.deleteDonation(id);
		
	}
	
	//Chuyển trạng thái đang quyên góp
	@Override
	@Transactional
	public void donatingDonation(DonationDTO donationDTO) {
		donationDao.donatingDonation(donationDTO);
		
	}
	
	//Chuyển trang thái kết thúc quyên góp
	@Override
	@Transactional
	public void endingDonation(DonationDTO donationDTO) {
		donationDao.endDonation(donationDTO);
		
	}
	
	//Chuyển trạng thái đóng quyên góp
	@Override
	@Transactional
	public void closingDonation(DonationDTO donationDTO) {
		donationDao.closeDonation(donationDTO);
		
	}
	
	//Tìm donation bằng id
	@Override
	@Transactional
	public DonationDTO findDonationByID(int id) {
		Optional<Donation> result = donationDao.findDonationByID(id);
		
		if(result.isPresent()) {
			Donation donation = result.get();
			DonationDTO donationDTO =  new DonationDTO(donation);
			
			return donationDTO;
		}
		
		return null;
	}
	
	//Xử lý phan trang donation
	@Override
	public List<Donation> findDonationsPages(Integer offset, Integer maxResult) {
		return donationDao.findDonationsPage(offset, maxResult);
	}

	@Override
	public Long count() {
		return donationDao.count();
	}
	
	//Tìm donation bằng id
	@Override
	public Donation findDonationByID2(int id) {
		Optional<Donation> result = donationDao.findDonationByID(id);
		
		if(result.isPresent()) {
			Donation donation = result.get();
			
			
			return donation;
		}
		
		return null;
	}
	
	//Cập nhật tiền donation
	@Override
	public void updateDonationMoney(int id, int money) {
		donationDao.updateDonationMoney(id, money);
		
	}

}
