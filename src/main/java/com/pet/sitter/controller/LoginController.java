package com.pet.sitter.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		MemberVO memberlogin = Mservice.memberLogin(mvo);
		
		System.out.println(memberlogin);
		
		if(memberlogin == null)
		{
			session.setAttribute("member", null);
			rttr.addFlashAttribute("membermsg" , false);
		}
		else
		{
			session.setAttribute("member", memberlogin.getUser_email());
		}
		
		return "redirect:/";
		
	}
	
	//로그인 get
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.GET)
	public void sitterLogin() throws Exception
	{
		logger.info("get sitterlogin page 접속");
	}
	
	
	//로그인 post
	@RequestMapping(value="/sitterLogin" , method = RequestMethod.POST)
	public String sitterLogin(SitterVO svo , HttpServletRequest req , RedirectAttributes rttr) throws Exception
	{
		logger.info("post sitterlogin 성공");
		
		HttpSession session = req.getSession();
		SitterVO sitterlogin = Sservice.sitterLogin(svo);
		
		System.out.println(Sservice.sitterLogin(svo));
		System.out.println("-----------------");
		System.out.println(sitterlogin.getSitter_email());
		System.out.println(svo.getSitter_password());
		
		
		if(sitterlogin.getSitter_email() == null)
		{
			session.setAttribute("sitter", null);
			rttr.addFlashAttribute("sittermsg" , false);
		}
		else
		{
			session.setAttribute("sitter", sitterlogin.getSitter_email());
		}
		
		return "redirect:/";
		
	}
	
	
	
	
		@RequestMapping(value="/logout" , method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception
		{
			System.out.println(session);
			logger.info("로그아웃 성공!!");
			session.invalidate();
			System.out.println(session);
			return "redirect:/";
		}
}
