package com.pet.sitter.service;

import java.util.List;

import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;

public interface ReviewService {

	// 리뷰 게시물 작성
	public void writeReview(ReviewVO vo) throws Exception;
	
	// 리뷰 게시물 목록 조회
	public List<ReviewVO> list(SearchCriteria scri) throws Exception;

	// 리뷰 게시물 총 갯수
    public int listCount(SearchCriteria scri) throws Exception;
	
	// 리뷰 게시물 조회
	public ReviewVO readReview(int rno) throws Exception;
	
	// 리뷰 게시물 수정
	public void update(ReviewVO ReviewVO) throws Exception;

	// 이미지 수정
	public void imageUpdate(ReviewVO ReviewVO) throws Exception;
	
	// 리뷰 게시물 삭제
	public void delete(int rno) throws Exception;
}
