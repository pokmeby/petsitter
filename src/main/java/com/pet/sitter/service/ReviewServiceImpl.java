package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.ReviewDao;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Inject
	private ReviewDao dao;
	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeReview(vo);
	}
	@Override
	public ReviewVO readReview(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReview(rno);
	}
	@Override
	public List<ReviewVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	@Override
	public void update(ReviewVO ReviewVO) throws Exception {
		// TODO Auto-generated method stub
		 dao.update(ReviewVO);
	}
	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		 dao.delete(rno);
	}
	@Override
	public void imageUpdate(ReviewVO ReviewVO) throws Exception {
		// TODO Auto-generated method stub
		dao.imageUpdate(ReviewVO);
	}
}
