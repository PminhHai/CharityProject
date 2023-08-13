package com.fx21044.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fx21044.dao.UserDonationDao;
import com.fx21044.dto.UserDonationDTO;
import com.fx21044.model.UserDonation;

@Service
public class UserDonationServiceImpl implements UserDonationService {
	
	@Autowired
	private UserDonationDao userDonationDao;
	
	//Lưu quyên góp
	@Override
	@Transactional
	public void saveUserDonation(UserDonationDTO userDonationDTO) {
		UserDonation userDonation = new UserDonation();
		
		userDonation.setName(userDonationDTO.getName());
		userDonation.setMoney(userDonationDTO.getMoney());
		userDonation.setStatus(userDonationDTO.getStatus());
		userDonation.setText(userDonationDTO.getText());
		userDonation.setCreatedDate(userDonationDTO.getCreateDate());
		userDonation.setUserId(userDonationDTO.getUserId());
		userDonation.setDonationId(userDonationDTO.getDonationId());
		
		userDonationDao.saveUserDonation(userDonation);
	}

	//Tìm quyên góp bằng id
	@Override
	@Transactional
	public UserDonation finUserDonationByID(int id) {
		return userDonationDao.findUserDonationByID(id);
	}

	//Thay đổi trạng thái quyên góp
	@Override
	@Transactional
	public void changeStatusUserDonation(int id, int status) {
		userDonationDao.changeStatusUserDonation(id, status);
		
	}

	//Tìm quyên góp bằng id
	@Override
	public UserDonationDTO finUserDonationDTOByID(int id) {
		UserDonation userDonation = userDonationDao.findUserDonationByID(id);
		
		if(userDonation != null) {
			UserDonationDTO userDonationDTO = new UserDonationDTO(userDonation);
			return userDonationDTO;
		}
		
		return null;
	}

	//Lấy danh sách quyên góp bằng donation id
	@Override
	public List<UserDonation> getListUserDonationsByDonationID(int donationID) {
		return userDonationDao.getListUserDonationsByStatus(donationID, 1);
	}


	

}
