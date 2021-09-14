package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.QnaReplyDAO;
import com.pet.sitter.vo.QnaReplyVO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{

	@Inject
	private QnaReplyDAO dao;

	//qna 답변 목록
	@Override
	public List<QnaReplyVO> readQnaReply(int qno) throws Exception {
		return dao.readQnaReply(qno);
	}

	//qna 답변 작성
	@Override
	public void writeQnaReply(QnaReplyVO vo) throws Exception {
		dao.writeQnaReply(vo);
	}

	//qna 답변 수정
	@Override
	public void updateQnaReply(QnaReplyVO vo) throws Exception {
		dao.updateQnaReply(vo);
	}

	//qna 답변 삭제
	@Override
	public void deleteQnaReply(QnaReplyVO vo) throws Exception {
		dao.deleteQnaReply(vo);
	}
	
	//선택된 qna 답변 조회
	@Override
	public QnaReplyVO selectQnaReply(int qna_rno) throws Exception {
		return dao.selectQnaReply(qna_rno);
	}
	
	
}
