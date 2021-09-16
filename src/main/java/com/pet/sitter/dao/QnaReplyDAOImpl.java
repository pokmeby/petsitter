package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.QnaReplyVO;




@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO{
	
	@Inject
	SqlSession sql;

	//qna 답변 조회
	@Override
	public List<QnaReplyVO> readReply(int qno) throws Exception {
		return sql.selectList("replyMapper.readReply",qno);
	}
	//qna 답변 작성
	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		System.out.println("여기 지나가니?" + vo);
		sql.insert("replyMapper.writeReply", vo);
		System.out.println("여기 지나가니?" + vo);
	}

	//qna 답변 수정
	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		sql.update("replyMapper.updateReply", vo);
	}

	//qna 답변 삭제
	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply", vo);
	}

	//선택된 qna 답변 조회
	@Override
	public QnaReplyVO selectReply(int qna_rno) throws Exception {
		return sql.selectOne("replyMapper.selectReply", qna_rno);
	}

}
