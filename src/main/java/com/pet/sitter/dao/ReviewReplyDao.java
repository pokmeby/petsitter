package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.ReviewReplyVO;

public interface ReviewReplyDao {

	public List<ReviewReplyVO> readReply(int rno) throws Exception;
	
	public void writeReply(ReviewReplyVO vo) throws Exception;
	
	public void updateReply(ReviewReplyVO vo) throws Exception;
	
	public void deleteReply(int re_num) throws Exception;
	
	public ReviewReplyVO selectReply(int re_num) throws Exception;
}
