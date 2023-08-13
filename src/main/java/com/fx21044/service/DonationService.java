package com.fx21044.service;

import java.util.List;
import java.util.Optional;

import com.fx21044.dto.DonationDTO;
import com.fx21044.model.Donation;

public interface DonationService {
	public List<Donation> getDonations();
	
	public void saveDonation(DonationDTO donationDTO);
	
	public void updateDonation(DonationDTO donationDTO);
	
	public void deleteDonation(int id);
	
	public void donatingDonation(DonationDTO donationDTO);
	
	public void endingDonation(DonationDTO donationDTO);
	
	public void closingDonation(DonationDTO donationDTO);
	
	public DonationDTO findDonationByID(int id);
	
	public Donation findDonationByID2(int id);
	
	public List<Donation> findDonationsPages(Integer offset, Integer maxResult);
	
	public Long count();
	
	public void updateDonationMoney(int id, int money);
}
