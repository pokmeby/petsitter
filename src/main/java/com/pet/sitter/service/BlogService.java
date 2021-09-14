package com.pet.sitter.service;

import java.util.List;

import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;


public interface BlogService {


	//게시글 작성
	public void write(BlogVO blogVO) throws Exception;
	
	//게시물 목록 조회
	public List<BlogVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri)throws Exception;
	
	//게시물 조회
	public BlogVO read(int bno)throws Exception;
	
	//게시물 수정
	public void update(BlogVO blogVO)throws Exception;
	
	//게시물 삭제
	public void delete(int bno)throws Exception;
	
	//게시물 좋아요
	public void likeAdd(BlogLikeVO likeVO) throws Exception;
	
	//게시물 좋아요 취소
	public void likeDelete(BlogLikeVO likeVO) throws Exception;
	
	public int likeRead(BlogLikeVO likeVO) throws Exception;
}
