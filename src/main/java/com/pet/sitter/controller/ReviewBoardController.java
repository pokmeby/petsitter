package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.ReviewReplyService;
import com.pet.sitter.service.ReviewService;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.ReviewReplyVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;

@Controller
@RequestMapping("/review/*")
public class ReviewBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);
	
	@Inject
	ReviewService service;

	@Inject
	ReviewReplyService replyservice;
	// review main page 
	/*
	@RequestMapping(value="/boardReview" , method=RequestMethod.GET)
	public void boardReview() throws Exception {
		logger.info("boardReview 들어가기 성공");
	}
	*/
	
	// review write page
	@RequestMapping(value="/writeReview", method=RequestMethod.GET)
	public void writeReview() throws Exception {
		logger.info("리뷰 글쓰기 페이지 들어가기 성공");
	}

	// image Update page 	imageUpdate
	@RequestMapping(value="/imageUpdate", method=RequestMethod.GET)
	public String updateImage(Model model,@ModelAttribute("scri") SearchCriteria scri, ReviewVO vo) throws Exception {
	
		logger.info("이미지 수정 페이지 들어가기 성공");
		System.out.println("image update page vo.getRno() : " + vo.getRno());
		model.addAttribute("imageUpdate", service.readReview(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "review/imageUpdate";
	}
	
	// Review Main page
	@RequestMapping(value="/boardReview", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("boardReview 들어가기 성공.");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/boardReview";
	}

	
	// review write post
	@RequestMapping(value = "/writeReview", method=RequestMethod.POST)
	public String writeReview(HttpServletRequest rs,@RequestParam("image") MultipartFile file, Model model, ReviewVO vo) throws Exception {
			logger.info("여기는 출력될까?");
		if(!file.getOriginalFilename().isEmpty()) {
			String path = rs.getSession().getServletContext().getRealPath("/");
			
			String DOWNLOAD_PATH = path + "/resources/image/";
			System.out.println("path = " + path);
			System.out.println("DownLoadPath = " + DOWNLOAD_PATH);

			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(
							
			new File(DOWNLOAD_PATH + "/", file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		
		String ReviewImage = file.getOriginalFilename();
		
		vo.setR_image(ReviewImage);
		service.writeReview(vo);
		logger.info("후기 글쓰기 성공");
		
		return "redirect:/review/boardReview";
	}
	
	// image Update post
	@RequestMapping(value = "/imageUpdate", method=RequestMethod.POST)
	public String imageUpdate(HttpServletRequest rs,@RequestParam("image") MultipartFile file,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr , ReviewVO vo) throws Exception {
		System.out.println("imageUpdate Post ");
		
		String rootPath = rs.getSession().getServletContext().getRealPath("/");
		String path = rootPath + "/resources/image/";
		String orName = file.getOriginalFilename();
		String ext = FilenameUtils.getExtension(orName);
		String rnonum = vo.getRno() + "." + ext;
		
		// Save mediaFile on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(path, rnonum)));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();
		}
		vo.setR_image(rnonum);
		service.imageUpdate(vo);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/review/boardReview";
	}
	
	// detail review get
	@RequestMapping(value = "/readReview", method=RequestMethod.GET)
	public String readReview(ReviewVO reviewVO , @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	logger.info("리뷰 상세보기 페이지 들어가기 성공");
	
	model.addAttribute("read", service.readReview(reviewVO.getRno()));
	model.addAttribute("scri", scri);
	
	List<ReviewReplyVO> replyList = replyservice.readReply(reviewVO.getRno());
	model.addAttribute("replyList", replyList);
	
		return "review/readReview";
	}
	
	//detail review post
	@RequestMapping(value = "/readReview", method=RequestMethod.POST)
	public String readReview(int rno) throws Exception {
		logger.info("리뷰 상세보기 성공");
		service.readReview(rno);
		
		return "redirect/review/readReview";
	}
	
	// board update get
	@RequestMapping(value = "/updateView", method=RequestMethod.GET)
	public String updateView(ReviewVO ReviewVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("게시판 수정 페이지 들어가기 성공");
		
		model.addAttribute("update", service.readReview(ReviewVO.getRno()));
		model.addAttribute("scri", scri);
		
		return "review/updateView";
	}
	
	// board update post
	@RequestMapping(value= "/update", method=RequestMethod.POST)
	public String update(ReviewVO ReviewVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("게시판 수정 성공");
		
		service.update(ReviewVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/review/boardReview";
	}
	
	// board delete post
	@RequestMapping(value ="/delete", method = RequestMethod.POST)
	public String delete(ReviewVO ReviewVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("delete del del del ~~");
		
		service.delete(ReviewVO.getRno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/review/boardReview";
	}
	
	@RequestMapping(value = "/replyWrite", method=RequestMethod.POST)
	public String replyWrite(ReviewReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("댓글 쓰기 성공");
			
			replyservice.writeReply(vo);
			
			rttr.addAttribute("rno", vo.getRno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/review/readReview";
	}
	
	//댓글 수정 GET
	   @RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	   public String replyUpdateView(ReviewReplyVO vo, SearchCriteria scri, Model model) throws Exception {
	      logger.info("reply get get");
	      
	      model.addAttribute("replyUpdate", replyservice.selectReply(vo.getRe_num()));
	      System.out.println(replyservice.selectReply(vo.getRe_num()));
	      model.addAttribute("scri", scri);
	      
	      return "review/replyUpdateView";
	   }
	   
	   //댓글 수정 POST
	   @RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	   public String replyUpdate(ReviewReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	      logger.info("reply update post post post");
	      
	      replyservice.updateReply(vo);
	      
	      rttr.addAttribute("rno", vo.getRno());
	      rttr.addAttribute("page", scri.getPage());
	      rttr.addAttribute("perPageNum", scri.getPerPageNum() );
	      rttr.addAttribute("searchType", scri.getSearchType() );
	      rttr.addAttribute("keyword", scri.getKeyword());
	      
	      return "redirect:/review/readReview";
	      
	      
	   }
	   
	//댓글 삭제 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReviewReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Delete ");
		
		model.addAttribute("replyDelete", replyservice.selectReply(vo.getRe_num()));
		model.addAttribute("scri", scri);
		return "review/replyDeleteView";
	}
	
	// 댓글 삭제
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReviewReplyVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply delete");
		
		replyservice.deleteReply(vo.getRe_num());
		
		rttr.addAttribute("rno", vo.getRno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/review/readReview";
	}
}
