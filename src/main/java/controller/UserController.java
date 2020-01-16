package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.Item;
import logic.ShopService;
import logic.User;
import util.CipherUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		return null;
	}
	//1. 비밀번호 : 해쉬화 db에 저장
	//2. email : id의 해쉬값에서 키 결정. 암호화 db에 저장
	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bresult) throws Exception {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}

		// useraccount 테이블에 내용 등록. login.jsp
		try {
			user.setPass(CipherUtil.makehash(user.getPass()));
			service.insert(user);
			mav.setViewName("redirect:../broadcast/index.shop");
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bresult, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			bresult.reject("error.input.user");
			System.out.println(bresult);
			return mav;
		}

		try {
			User dbUser = service.getUser(user.getUserid());
			user.setPass(CipherUtil.makehash(user.getPass())); // Hash 암호화

			if (!dbUser.getPass().equals(user.getPass())) {
				bresult.reject("error.login.password");
				return mav;
			} else {
				session.setAttribute("loginUser", dbUser);
				mav.setViewName("redirect:../broadcast/index.shop");
			}
		} catch (LoginException e) {
			e.printStackTrace();
			bresult.reject("error.login.id");
		}
		return mav;

	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.shop";
	}
	@RequestMapping("main") //UserLoginAspect 클래스에 해당하는 핵심로직
	public String checkmain(HttpSession session) {
		return "user/main";
	}
	
	@GetMapping(value= {"update","delete"})
	public ModelAndView checkview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
	try {
		String userid = CipherUtil.makehash(user.getUserid());
		String email = CipherUtil.decrypt(user.getEmail(),userid.substring(0,16));
		user.setEmail(email);
	} catch (Exception e) {
		e.printStackTrace();
	}
		mav.addObject("user",user);
		return mav;
	}
	  
	
	
}
