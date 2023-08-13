package com.fx21044.dao;

import java.util.List;

import com.fx21044.dto.UserDonationDTO;
import com.fx21044.model.UserDonation;

public interface UserDonationDao {
	
	public UserDonation findUserDonationByID(int id);
	
	public void saveUserDonation(UserDonation userDonation);
	
	public void changeStatusUserDonation(int id, int status);
	
	public List<UserDonation> getListUserDonationsByStatus(int donationId, int status);
}	
