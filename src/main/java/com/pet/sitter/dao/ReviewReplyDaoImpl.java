package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.ReviewReplyVO;

@Repository
public class ReviewReplyDaoImpl implements ReviewReplyDao{

	@Inject SqlSession sql;

	@Override
	public List<ReviewReplyVO> readReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("ReviewReplyMapper.readReply", rno);
	}

	@Override
	public void writeReply(ReviewReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("ReviewReplyMapper.writeReply", vo);
	}

	@Override
	public void updateReply(ReviewReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("ReviewReplyMapper.updateReply", vo);
	}

	@Override
	public void deleteReply(int re_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("ReviewReplyMapper.deleteReply", re_num);
	}

	@Override
	public ReviewReplyVO selectReply(int re_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("ReviewReplyMapper.selectReply", re_num);
	}
	
	
}
