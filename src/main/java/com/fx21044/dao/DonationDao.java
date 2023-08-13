package com.fx21044.dao;

import java.util.List;
import java.util.Optional;

import com.fx21044.dto.DonationDTO;
import com.fx21044.model.Donation;

public interface DonationDao {
	public List<Donation> getDonations();
	
	public void saveDonation(Donation donation);
	
	public void updateDonation(DonationDTO donationDTO);
	
	public void deleteDonation(int id);
	
	public void donatingDonation(DonationDTO donationDTO);
	
	public void endDonation(DonationDTO donationDTO);
	
	public void closeDonation(DonationDTO donationDTO);
	
	public Optional<Donation> findDonationByID(int id);
	
	public List<Donation> findDonationsPage(Integer offset, Integer maxResult);
	
	public Long count();
	
	public void updateDonationMoney(int id, int money);
}
