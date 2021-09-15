package com.pet.sitter.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.MemberService;
import com.pet.sitter.service.SitterService;
import com.pet.sitter.vo.MemberVO;
import com.pet.sitter.vo.SitterVO;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Inject
	MemberService Mservice;
	
	@Inject
	SitterService Sservice;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
			

	//로그인 get
	@RequestMapping(value="/memberLogin" , method = RequestMethod.GET)
	public void memberLogin() throws Exception
	{
		logger.info("get login 로그인 되나 ~~~~");
	}
	
	
	//로그인 post
	@RequestMapping(value="/memberLogin" , method = RequestMethod.POST)
	public String memberLogin(MemberVO mvo , HttpServletRequest req , RedirectAttributes rttr) throws Exception
	{
		logger.info("post memberlogin 성공");
		
		HttpSession session = req.getSession();
		MemberVO login = Mservice.memberLogin(mvo);
		
		if(login == null)
		{
			session.setAttribute("member", null);
			rttr.addFlashAttribute("membermsg" , false);
		}
		else
		{
			session.setAttribute("member", login.getUser_email());
		}
		
		return "redirect:/blog/list";
		
	}
	
	//로그인 get
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.GET)
	public void sitterLogin() throws Exception
	{
		logger.info("get sitterlogin 성공");
	}
	
	
	//로그인 post
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.POST)
	public String sitterLogin(SitterVO svo , HttpServletRequest req , RedirectAttributes rttr) throws Exception
	{
		logger.info("post memberlogin 성공");
		
		HttpSession session = req.getSession();
		SitterVO login = Sservice.sitterLogin(svo);
		
		if(login == null)
		{
			session.setAttribute("sitter", null);
			rttr.addFlashAttribute("sittermsg" , false);
		}
		else
		{
			session.setAttribute("sitter", svo.getSitter_email());
		}
		
		return "home";
		
	}
	
	
	
	
		@RequestMapping(value="/logout" , method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception
		{
			logger.info("로그아웃 성공!!");
			session.invalidate();
			
			return "redirect:/";
		}
}
