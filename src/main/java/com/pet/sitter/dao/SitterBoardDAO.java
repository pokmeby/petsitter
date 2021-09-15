package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

public interface SitterBoardDAO {
	// sitter 프로필리스트 조회
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception;

	// sitter 프로필 디테일 조회
	public SitterBoardVO profileView(String email) throws Exception;
	
	// sitter 프로필 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// sitter 프로필 수정
	public void update(SitterBoardVO sbvo) throws Exception;

	// sitter 프로필 이미지 수정
	public void updateImage(String image) throws Exception;
	
}
