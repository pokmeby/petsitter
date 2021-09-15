package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.SitterBoardService;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Controller
@RequestMapping("/sitter/*")
public class SitterBoardController {
	private static final Logger log = LoggerFactory.getLogger(SitterBoardController.class);

	// realpath :
	// C:\spring_0826\spring_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\pet_sitter\/upload/sitter_profile/
	@Inject
	SitterBoardService sb_service;

	// sitter 프로필 리스트조회
	@RequestMapping(value = "/profileBoard", method = RequestMethod.GET)
	public String profileList(HttpServletResponse res, Model model, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {
		log.info("profileList GET");
		model.addAttribute("profileList", sb_service.sbList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(sb_service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "sitter/sitt_profile_board";
	}

	// sitter 프로필 디테일
	@RequestMapping(value = "/profileView", method = RequestMethod.GET)
	public String ProfileView(SitterBoardVO sbvo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		log.info("profileView GET");
		model.addAttribute("profileView", sb_service.profileView(sbvo.getSitter_email()));
		model.addAttribute("scri", scri);
		return "sitter/sitt_profile_detail";
	}

	// sitter 프로필 수정뷰
	@RequestMapping(value = "/profileEditView", method = RequestMethod.GET)
	public String editSitterProfileView(SitterBoardVO sbvo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		log.info("editSitterProfileView GET");
		model.addAttribute("profileEdit", sb_service.profileView(sbvo.getSitter_email()));
		model.addAttribute("scri", scri);
		return "sitter/sitt_profile_edit";
	}
	
	// sitter 프로필 이미지 수정뷰
	@RequestMapping(value="/profileImageEV", method = RequestMethod.GET)
	public String imageEditView(SitterBoardVO sbvo, Model model) throws Exception{
		log.info("imageEdit GET");
		model.addAttribute("profileEdit", sb_service.profileView(sbvo.getSitter_email()));
		return "sitter/sitt_profile_image";
	}
	
	// sitter 프로필 이미지 수정
	 @RequestMapping(value="/profileImageEdit", method=RequestMethod.POST) 
	 public String imageEdit(SitterBoardVO sbvo,HttpServletRequest rs, @RequestParam("file") MultipartFile file, @ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception {
		 log.info("imageEdit POST");
	  String rootPath = rs.getSession().getServletContext().getRealPath("/");
	  String path = rootPath + "/upload/sitter_profile/";
	  String orName = file.getOriginalFilename();
	  String ext = FilenameUtils.getExtension(orName);
	  String sittName = sbvo.getSitter_email() + "." + ext;
		// Save mediaFile on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(path, sittName)));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		sbvo.setSitter_image(sittName);
		sb_service.updateImage(sbvo.getSitter_image());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/sitter/profileBoard"; // 메인페이지
	  }
	 
	// sitter 프로필 수정
	@RequestMapping(value = "/profileEdit", method = RequestMethod.POST)
	public String editSitterProfile( SitterBoardVO sbvo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		log.info("editSitterProfile POST");
		
		sb_service.update(sbvo);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/sitter/profileBoard"; // 메인페이지
	}
	
	// sitter 예약신청
	@RequestMapping(value="/sittReserve", method = RequestMethod.GET)
	public String sittReserve(SitterBoardVO sbvo) {
		log.info("sittReserve GET");
		System.out.println("email : "+sbvo.getSitter_email());
		return "/sitter/sitt_reserv_popup";
	}
	
	@ResponseBody
	@RequestMapping(value="/sittReserverq", method = RequestMethod.POST)
	public String reqReserve(SitterBoardVO sbvo) {
		log.info("reqReserve GET");
		
		return "/sitter/sitt_profile_detail?sitter_email="+sbvo.getSitter_email();
	}
}
