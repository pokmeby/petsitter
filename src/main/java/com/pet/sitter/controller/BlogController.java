package com.pet.sitter.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.BlogService;
import com.pet.sitter.service.ReplyService;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.ReplyVO;
import com.pet.sitter.vo.SearchCriteria;


@Controller
@RequestMapping("/blog/*")
public class BlogController {

	@Inject BlogService service;

	@Inject ReplyService replyService;
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String boardlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		System.out.println("list 출력 완료");

		model.addAttribute("list", service.list(scri));

		System.out.println("리스트 에 들어있는 값들은? = " + 	service.list(scri).toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		
		return "blog/list";
	}
	

	
	//게시판 글 작성 화면
		@RequestMapping(value="/writeView", method= RequestMethod.GET)
		public void writeView()throws Exception{
			System.out.println("write View Page");
		}
		
		
		
		@RequestMapping(value="/write", method= RequestMethod.POST)
		public String write(HttpServletRequest rs,@RequestParam("image") MultipartFile file, Model model, BlogVO vo) throws Exception{
			
			//save mediaFile on System
			if(!file.getOriginalFilename().isEmpty()) {
				String path = rs.getSession().getServletContext().getRealPath("/");
				
				String DOWNLOAD_PATH = path + "/resources/images/";
		System.out.println("DownLoadPath = " + DOWNLOAD_PATH);
				BufferedOutputStream outputStream = new BufferedOutputStream(
						new FileOutputStream(
				new File(DOWNLOAD_PATH + "/", file.getOriginalFilename())));
				outputStream.write(file.getBytes());
				outputStream.flush();
				outputStream.close();
			}
			
			String blogImage = file.getOriginalFilename();
			 
			vo.setBlog_image(blogImage);
			service.write(vo);
			
			return "redirect:/blog/list";
		}
		

		//게시판 조회
		@RequestMapping(value="/readView", method= RequestMethod.GET)
		public String read(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			System.out.println("게시물 조회! ");
			
			model.addAttribute("read", service.read(vo.getBlog_bno()));
			model.addAttribute("scri", scri);
			
			List<ReplyVO> replyList = replyService.readReply(vo.getBlog_bno());
			model.addAttribute("replyList", replyList);
			
			return "blog/readView";
		}
		

		@RequestMapping(value="/updateView", method= RequestMethod.GET)
		public String updateView(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
			System.out.println("게시판 수정 해볼까?! ");
			
			model.addAttribute("update", service.read(vo.getBlog_bno()));
			model.addAttribute("scri", scri);
			
			return "blog/updateView";
		}
		
		//게시판 수정
		@RequestMapping(value="/update", method=RequestMethod.POST)
		public String update(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			System.out.println("수정 중,,,, ");
			
			service.update(vo);
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/list";
		}
		
		//게시판 삭제
		@RequestMapping(value="/delete", method= RequestMethod.POST)
		public String delete(BlogVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			
			service.delete(vo.getBlog_bno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/list";
		}
		

		//댓글 작성
		@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr )throws Exception{
			
			replyService.writeReply(vo);
			rttr.addAttribute("blog_bno", vo.getBlog_no());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/readView";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method=RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception{
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getReply_no()));
			model.addAttribute("scri", scri);
			return "blog/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method=RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{

			replyService.updateReply(vo);
			rttr.addAttribute("blog_bno", vo.getBlog_no());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/readView";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method=RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception{
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getReply_no()));
			model.addAttribute("scri", scri);
			
			return "blog/replyDeleteView";
		}
		
		//댓글 삭제 POST
		@RequestMapping(value="/replyDelete", method=RequestMethod.POST)
		public String replyDelete(ReplyVO vo,SearchCriteria scri, RedirectAttributes rttr) throws Exception {

			replyService.deleteReply(vo);
			rttr.addAttribute("blog_bno", vo.getBlog_no());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/readView";
		}
		
		@RequestMapping(value="/like", method=RequestMethod.GET)
		public String like(BlogLikeVO vo, Model model, SearchCriteria scri) throws Exception{
			model.addAttribute("likeStatus", service.likeRead(vo));
			model.addAttribute("scri", scri);
			
			return "blog/like";
		}
		//좋아요 구현
		@RequestMapping(value="/like", method=RequestMethod.POST)
		public String likeBlog( BlogLikeVO vo,  RedirectAttributes rttr,SearchCriteria scri) throws Exception{
			if(vo.getLikeBlog_status() == '1') {
				service.likeDelete(vo);
			} else {
				service.likeDelete(vo);
			}
			rttr.addAttribute("blog_bno", vo.getLikeBlog_bno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/blog/readView";
		}
}
