package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.SitterBoardDAO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Service
public class SitterBoardServiceImpl implements SitterBoardService{

	@Inject
	private SitterBoardDAO sb_dao;
	
	// 프로필 리스트 조회
	@Override
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception {
		return sb_dao.sbList(scri);
	}
	
	// 프로필 상세 뷰
	@Override
	public SitterBoardVO profileView(String email) throws Exception {
		return sb_dao.profileView(email);
	}
	

	// sitterBoardList 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sb_dao.listCount(scri);
	}

	// 프로필 수정
	@Override
	public void update(SitterBoardVO sbvo) throws Exception {
		sb_dao.update(sbvo);
	}

	@Override
	public void updateImage(String image) throws Exception {
		sb_dao.updateImage(image);
	}	
	
}
