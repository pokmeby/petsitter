package com.pet.sitter.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.sitter.service.QnaReplyService;
import com.pet.sitter.service.QnaService;
import com.pet.sitter.vo.PageMaker;
import com.pet.sitter.vo.QnaReplyVO;
import com.pet.sitter.vo.QnaVO;
import com.pet.sitter.vo.SearchCriteria;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	QnaService qnaService;

	@Inject
	QnaReplyService qnaReplyService;


	//qna 메인
	@RequestMapping(value="/qnaMain", method = RequestMethod.GET)
	public void qnaMain() throws Exception{
		logger.info("qna main");
	}
	
	//qna 작성화면
	@RequestMapping(value = "/qnaWriteView", method = RequestMethod.GET)
	public void qnaWriteView() throws Exception{
		logger.info("qna write view");
	}

	//qna 작성
	@RequestMapping(value = "/qnaWrite", method = RequestMethod.POST)
	public String qnaWrite(QnaVO qnaVO) throws Exception{
		logger.info("qna write");

		qnaService.qnaWrite(qnaVO);

		return "redirect:/qna/qnaList";


	}

	//qna 목록 조회
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("qna list");

		model.addAttribute("list", qnaService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "qna/qnaList";
	}

	//qna 읽기
	@RequestMapping(value = "/qnaReadView", method = RequestMethod.GET)
	public String qnaRead(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception {

		logger.info("qna read");

		model.addAttribute("read", qnaService.qnaRead(qnaVO.getQno()));
		model.addAttribute("scri", scri);

		List<QnaReplyVO> replyList = qnaReplyService.readReply(qnaVO.getQno());
		model.addAttribute("replyList", replyList);

		return "qna/qnaReadView";
	}

	//qna 수정뷰 
	@RequestMapping(value = "/qnaUpdateView", method = RequestMethod.GET)
	public String qnaUpdateView(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("qnaUpdateView");

		model.addAttribute("update", qnaService.qnaRead(qnaVO.getQno()));
		model.addAttribute("scri", scri);

		return "qna/qnaUpdateView";
	}

	//qna 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna Update");

		qnaService.qnaUpdate(qnaVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaList";
	}

	//qna 삭제
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String qnaDelete(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna delete");

		qnaService.qnaDelete(qnaVO.getQno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaList";

	}

	//qna 답변 작성
	@RequestMapping(value="/qnaReplyWrite", method = RequestMethod.POST)
	public String qnaReplyWrite(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply Write");

		qnaReplyService.writeReply(vo);
		logger.info("qna reply Writedddddd");
		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaReadView";
	}

	//qna 답변 수정 GET
	@RequestMapping(value="/qnaReplyUpdateView", method = RequestMethod.GET)
	public String qnaReplyUpdateView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("qna reply update get");
		System.out.println(vo);

		model.addAttribute("replyUpdate", qnaReplyService.selectReply(vo.getQna_rno()));
		model.addAttribute("scri", scri);

		return "qna/qnaReplyUpdateView";
	}

	//qna 답변 수정 POST
	@RequestMapping(value="/qnaReplyUpdate", method = RequestMethod.POST)
	public String qnaReplyUpdate(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply update post");

		qnaReplyService.updateReply(vo);
		System.out.println(vo);

		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaReadView";


	}

	//qna 답변 삭제 GET
	@RequestMapping(value="/qnaReplyDeleteView", method = RequestMethod.GET)
	public String qnaReplyDeleteView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("qna reply delete");

		model.addAttribute("replyDelete", qnaReplyService.selectReply(vo.getQna_rno()));
		model.addAttribute("scri", scri);

		return "qna/qnaReplyDeleteView";
	}

	// qna 답변 삭제
	@RequestMapping(value="/qnaReplyDelete", method = RequestMethod.POST)
	public String qnaReplyDelete(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("qna reply delete");

		qnaReplyService.deleteReply(vo);

		rttr.addAttribute("qno", vo.getQno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum() );
		rttr.addAttribute("searchType", scri.getSearchType() );
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/qna/qnaReadView";


	}

}
