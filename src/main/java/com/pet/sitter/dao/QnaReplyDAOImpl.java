package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.pet.sitter.controller.QnaController;
import com.pet.sitter.vo.QnaReplyVO;

@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(QnaReplyDAOImpl.class);

	@Inject
	SqlSession sql;

	//qna 답변 조회
	@Override
	public List<QnaReplyVO> readQnaReply(int qno) throws Exception {
		return sql.selectList("qnaReplyMapper.readReply",qno);
	}
	//qna 답변 작성
	@Override
	public void writeQnaReply(QnaReplyVO vo) throws Exception {
		sql.insert("qnaReplyMapper.writeQnaReply", vo);
	}

	//qna 답변 수정
	@Override
	public void updateQnaReply(QnaReplyVO vo) throws Exception {
		sql.update("qnaReplyMapper.updateReply", vo);
	}

	//qna 답변 삭제
	@Override
	public void deleteQnaReply(QnaReplyVO vo) throws Exception {
		sql.delete("qnaReplyMapper.deleteReply", vo);
	}

	//선택된 qna 답변 조회
	@Override
	public QnaReplyVO selectQnaReply(int qna_rno) throws Exception {
		return sql.selectOne("qnaReplyMapper.selectReply", qna_rno);
	}

}
