package com.fx21044.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fx21044.dto.DonationDTO;
import com.fx21044.dto.UserDTO;
import com.fx21044.dto.UserDonationDTO;
import com.fx21044.dto.UserDonationDTO2;
import com.fx21044.model.Donation;
import com.fx21044.model.Role;
import com.fx21044.model.User;
import com.fx21044.model.UserDonation;
import com.fx21044.service.DonationService;
import com.fx21044.service.RoleService;
import com.fx21044.service.UserDonationService;
import com.fx21044.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	//trang home admin
	@GetMapping()
	public String adminHome() {
		return "templates/admin/home";	
	}
	
	//Xử lý hiển thị trang home admin
	@GetMapping("/account")
	public String adminAccount(Model theModel) {
		List<User> theUsers = userService.getUsers();
		List<Role> theRoles = roleService.getRoles();
		
		theModel.addAttribute("users", theUsers);
		theModel.addAttribute("roles", theRoles);
		
		UserDTO theUser =  new UserDTO();
		
		theModel.addAttribute("user2",theUser);
		
		return "templates/admin/account";	
	}
	
	//Xử lý thêm account
	@PostMapping("/add-new-account")
	public String saveUser(@ModelAttribute("user2") UserDTO theUser) {
		
		System.out.println(theUser.toString());
		userService.saveUser(theUser);
		
		return "redirect:/admin/account";
	}
	
	//Xử lý cập nhật thông tin account
	@PostMapping("/update-account")
	public String updateUser(@ModelAttribute("user2") UserDTO theUser) {
		
		System.out.println("XXX" + theUser.toString());
		userService.updateUser(theUser);
		
		return "redirect:/admin/account";
	}
	
	//Xử lý xóa account
	@PostMapping("/delete-user")
	public String deleteUser(@ModelAttribute("user2") UserDTO theUser) {
		System.out.println("XXX" + " delete " + theUser.getId());
		userService.deleteUser(theUser.getId());
		return "redirect:/admin/account";
	}
	
	//Xử lý khóa account
	@PostMapping("/lock-user")
	public String lockUser(@ModelAttribute("user2") UserDTO theUser) {
		userService.lockUser(theUser);
		
		return "redirect:/admin/account";
	}
	
	//Xử lý trang donation
	@GetMapping("/donation")
	public String adminDonation(Model theModel) {
		List<Donation> donations = donationService.getDonations();
		
		theModel.addAttribute("donations", donations);
		
		DonationDTO theDonation = new DonationDTO();
		
		theModel.addAttribute("donation2", theDonation);
		
		return "templates/admin/donation";	
	}
	
	//Xử lý thêm donation
	@PostMapping("/add-new-donation")
	public String addDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		
		System.out.println(donationDTO.toString());
		donationService.saveDonation(donationDTO);
		
		return "redirect:/admin/donation";
	}
	
	//Xử lý cập nhật donation
	@PostMapping("/update-donation")
	public String updateDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		System.out.println(donationDTO.toString());
		donationService.updateDonation(donationDTO);
		
		return "redirect:/admin/donation";
	}
	
	//Xử lý xóa donation
	@PostMapping("/delete-donation")
	public String deleteDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		System.out.println("XXX" + " delete " + donationDTO.getId());
		donationService.deleteDonation(donationDTO.getId());
		
		return "redirect:/admin/donation";
	}
	
	//Chuyển trạng thái đang quyên góp
	@PostMapping("/donating-donation")
	public String donatingDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		
		donationService.donatingDonation(donationDTO);
		
		return "redirect:/admin/donation";
	}
	
	//Chuyển trạng thái kết thúc quyên góp
	@PostMapping("/ending-donation")
	public String endingDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		
		donationService.endingDonation(donationDTO);
		
		return "redirect:/admin/donation";
	}
	
	//Chuyển trạng thái đóng quyên góp
	@PostMapping("/closing-donation")
	public String closingDonation(@ModelAttribute("donation2") DonationDTO donationDTO) {
		
		donationService.closingDonation(donationDTO);
		
		return "redirect:/admin/donation";
	}
	
	//Chi tiết đợt quyên góp
	@GetMapping("/detail/{donationId}")
	public String detailDonation(@PathVariable("donationId") int id, Model theModel) {
		
		DonationDTO donationDTO = donationService.findDonationByID(id);
		
		theModel.addAttribute("donation", donationDTO);
		
		List<UserDonation> userDonations = userService.getUserDonationsByDonationID(id);
		
		theModel.addAttribute("userDonations",userDonations);
		
		
		return "templates/admin/detail";
	}
	
	//Xử lý xác nhận quyên góp
	@PostMapping("/detail/acceptStatusUserDonation")
	public String acceptStatusUserDonation(@ModelAttribute("userDonation") UserDonationDTO userDonationDTO) {
		
		UserDonation userDonation = userDonationService.finUserDonationByID(userDonationDTO.getId());
		
		Donation donation = donationService.findDonationByID2(userDonationDTO.getDonationId());
		
		userDonationService.changeStatusUserDonation(userDonation.getId(), 1);
		
		donationService.updateDonationMoney(donation.getId(), userDonation.getMoney());
		
		System.out.println(userDonationDTO.toString());
		
		return "redirect:/admin/detail/" + userDonationDTO.getDonationId();
	}
	
	//Xử lý hủy xác nhận quyên góp
	@PostMapping("/detail/unacceptStatusUserDonation")
	public String unacceptStatusUserDonation(@ModelAttribute("userDonation") UserDonationDTO userDonationDTO) {
		
		UserDonation userDonation = userDonationService.finUserDonationByID(userDonationDTO.getId());
		
		Donation donation = donationService.findDonationByID2(userDonationDTO.getDonationId());
		
		userDonationService.changeStatusUserDonation(userDonation.getId(), 2);
		
		System.out.println(userDonationDTO.toString());
		
		return "redirect:/admin/detail/" + userDonationDTO.getDonationId();
	}
}
