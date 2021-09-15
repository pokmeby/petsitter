package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.ReviewReplyDao;
import com.pet.sitter.vo.ReviewReplyVO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService{

	@Inject
	private ReviewReplyDao dao;

	@Override
	public List<ReviewReplyVO> readReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(rno);
	}

	@Override
	public void writeReply(ReviewReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReply(vo);
	}

	@Override
	public void updateReply(ReviewReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(vo);
	}

	@Override
	public void deleteReply(int re_num) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(re_num);
	}

	@Override
	public ReviewReplyVO selectReply(int re_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(re_num);
	}
	
	
}
