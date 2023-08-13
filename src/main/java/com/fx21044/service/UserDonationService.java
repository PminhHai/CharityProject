package com.fx21044.service;

import java.util.List;

import com.fx21044.dto.UserDonationDTO;
import com.fx21044.model.UserDonation;

public interface UserDonationService {
	public void saveUserDonation(UserDonationDTO userDonationDTO);
	
	public UserDonation finUserDonationByID(int id);
	
	public void changeStatusUserDonation(int id, int status);
	
	public UserDonationDTO finUserDonationDTOByID(int id);
	
	public List<UserDonation> getListUserDonationsByDonationID(int donationID);
}
