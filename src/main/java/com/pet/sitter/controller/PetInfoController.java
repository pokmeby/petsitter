package com.pet.sitter.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.MemberService;
import com.pet.sitter.service.PetInfoService;
import com.pet.sitter.vo.PetInfoVO;
import com.pet.sitter.vo.SearchCriteria;

@Controller
@RequestMapping("/petinfo/*")
public class PetInfoController {
	
	
	@Inject
	MemberService service;
	
	@Inject
	PetInfoService pservice;
	
	private static final Logger logger = LoggerFactory.getLogger(PetInfoController.class);
	

	
	// 프로필 쓰기
	@RequestMapping(value="/petinfoForm" , method = RequestMethod.GET)
	public void infoWriteView()throws Exception
	{
		logger.info("pet info write GET 실행");
							
	}
	
	// 프로필 쓰기
	@RequestMapping(value="/infowrite" , method = RequestMethod.POST)
	public String infoWrite(PetInfoVO pvo)throws Exception
	{
		logger.info("pet info write POST 실행");
		System.out.println("petinfo 들어간 값" + pvo.getPet_type());
		pservice.infoWrite(pvo);
		
		return "home";
						
	}
	
	// 펫 정보 수정
	@RequestMapping(value="/petinfoUpdateForm" , method =RequestMethod.GET)
	public String petinfoUpdate(PetInfoVO Petvo,HttpSession session, @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception {
		
		String id = (String)session.getAttribute("member");
		System.out.println("Pet update FOrm  까지는 온다잉" + id);
		
		Petvo.setUser_email(id);
		model.addAttribute("read2", pservice.infoRead(Petvo.getUser_email()));
		model.addAttribute("scri", scri);
		
		System.out.println("read2 : " + Petvo.getUser_email());
		
		logger.info("펫 정보 수정 페이지 접속 ");
		
		return "petinfo/petinfoUpdateForm";
	}
	
	// 펫 정보 수정 post
	@RequestMapping(value="/infoUpdate" , method = RequestMethod.POST)
	public String infoUpdate(PetInfoVO pvo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception
	{
		model.addAttribute("read", pservice.infoRead(pvo.getUser_email()));
		model.addAttribute("scri", scri);

		
		logger.info("pet info update POST 실행");
		System.out.println("petinfo 들어간 값" + pvo.getPet_type());
		pservice.infoUpdate(pvo);
		
		return "home";
		
	}
	
	//프로필 보기
	@RequestMapping(value="/inforead" , method = RequestMethod.GET)
	public String infoRead(PetInfoVO pvo, Model model) throws Exception
	{
		logger.info("pet info read GET 실행");
		
		
		model.addAttribute("read" , pservice.infoRead(pvo.getUser_email()));
		
		return "pet/inforead";
				
	}
	
	//프로필 삭제 get
		@RequestMapping(value="/DeleteView" , method = RequestMethod.GET)
		public String infoDeleteView() throws Exception
		{
			return "pet/infoDeleteView";
		}
	
	
	
	//프로필 삭제 post
	@RequestMapping(value="infodelete" , method = RequestMethod.POST)
	public String infoDelete(PetInfoVO pvo, HttpSession session, RedirectAttributes rttr)throws Exception
	{
		logger.info("pet info delete post 실행");
		
		// 세션에 있는 petinfo를 가져와 pvo 변수에 넣어준다
		PetInfoVO pet = (PetInfoVO)session.getAttribute("pet");
		// 세션에 있는 이메일
		String sessionEmail = pet.getUser_email();
		// vo로 들어오는 이메일
		String voEmail = pvo.getUser_email();
		
		if(!(sessionEmail.equals(voEmail)))
		{
			rttr.addFlashAttribute("msg" , false);
			return "redirect/pet/infoDelete";
		}
		
		pservice.infoDelete(pvo); 
		
		session.invalidate();
		
		return "redirect/";
		
		
		
		
	}
	
	

}
