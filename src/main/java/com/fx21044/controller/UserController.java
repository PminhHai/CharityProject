package com.fx21044.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fx21044.dto.DonationDTO;
import com.fx21044.dto.SignUpPageDTO;
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
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DonationService donationService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserDonationService userDonationService;
	
	//trang home user
	@GetMapping()
	public String userHome(Model theModel, Integer offset, Integer maxResult) {
		List<Donation> donations = donationService.findDonationsPages(offset, maxResult);
		
		theModel.addAttribute("count", donationService.count());
		theModel.addAttribute("offset", offset);
		theModel.addAttribute("donations", donations);
		
		UserDonationDTO2 userDonation = new UserDonationDTO2();
		theModel.addAttribute("userDonation", userDonation);
		
		
		return "templates/public/home";	
	}
	
	//trang login
	@GetMapping("/login")
	public String loginPage(Model model) {
		
		model.addAttribute("user", new User());
		
		return "templates/admin/login";
	}
	
	//Xử lý login
	@PostMapping("/login")
	public String login(@ModelAttribute("user") User user, HttpSession session,Model model) {
		
		User loginUser = userService.checkLogin(user.getUserName(), user.getPassword());
		
		if(loginUser != null) {
			if(loginUser.getStatus() == 0) {
				model.addAttribute("error", "Tài khoản của bạn bị khóa <br>");
				return "templates/admin/login";
			} else if(loginUser.getStatus() == 1 ) {
				if(loginUser.getRole().getId() == 1) {
					session.setAttribute("username", loginUser.getUserName());
					session.setAttribute("userId", loginUser.getId());
					return "redirect:/admin";
				} 
				else if(loginUser.getRole().getId() == 2 ) {
					session.setAttribute("username", loginUser.getUserName());
					session.setAttribute("userId", loginUser.getId());
					return "redirect:/user";
				}
			}
		}else {
			model.addAttribute("error", "Sai tài khoản hoặc mật khẩu <br>");
			return "templates/admin/login";
		}
		
		
		return "redirect:/admin/account";
	}
	
	@GetMapping("/signup")
	public String signUpPage(Model model) {
		
		model.addAttribute("user", new SignUpPageDTO());
		
		return "templates/admin/registration-form";
	}
	
	@PostMapping("/processSignUp")
	public String signUpConfirm(@ModelAttribute("user") SignUpPageDTO theUser) {
		
		userService.saveUser(theUser);
		return "templates/admin/registration-confirm";
	}
	
	//logout
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		session.removeAttribute("username");
		return "redirect:/user/login";
	}
	
	//Xử lý thêm quyên góp
	@PostMapping("/add-user-donation")
	public String addUserDonation(@ModelAttribute("userDonation") UserDonationDTO2 userDonationDTO, HttpSession session) {
		
		
		User user = userService.findUserByUserName(userDonationDTO.getUsername());
		
		UserDonationDTO userDonationDTO2 = new UserDonationDTO();
		userDonationDTO2.setName(userDonationDTO.getName());
		userDonationDTO2.setMoney(userDonationDTO.getMoney());
		userDonationDTO2.setStatus(userDonationDTO.getStatus());
		userDonationDTO2.setText(userDonationDTO.getText());
		userDonationDTO2.setCreateDate(userDonationDTO.getCreateDate());
		userDonationDTO2.setDonationId(userDonationDTO.getDonationId());
		userDonationDTO2.setUserId(user.getId());
		
		userDonationService.saveUserDonation(userDonationDTO2);
		
		return "redirect:/user";
	}
	
	//Trang chi tiết quyên góp
	@GetMapping("/detail-user/{donationId}")
	public String detailUser(@PathVariable("donationId") int id, Model theModel) {
		
		DonationDTO donationDTO = donationService.findDonationByID(id);
		
		theModel.addAttribute("donation", donationDTO);
		
		UserDonationDTO2 userDonationDTO = new UserDonationDTO2();
				
		theModel.addAttribute("userDonation",userDonationDTO);
		
		List<UserDonation> userDonations = userDonationService.getListUserDonationsByDonationID(id);
		
		theModel.addAttribute("users",userDonations);
		
		return "templates/public/detail";
	}
}
