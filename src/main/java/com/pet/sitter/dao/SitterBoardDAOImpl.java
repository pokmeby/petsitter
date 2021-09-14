package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Repository
public class SitterBoardDAOImpl implements SitterBoardDAO{

	@Inject 
	private SqlSession session;
	
	// 리스트 조회
	@Override
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception {
		return session.selectList("sitterBoardMapper.sbList",scri);
	}

	// 프로필 상세조회 
	@Override
	public SitterBoardVO profileView(String email) throws Exception {
		return session.selectOne("sitterBoardMapper.profileView",email);
	}
	
	// sitterBoardList 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return session.selectOne("sitterBoardMapper.listCount",scri);
	}

	// 프로필 수정
	@Override
	public void update(SitterBoardVO sbvo) throws Exception {
		session.update("sitterBoardMapper.editBoard",sbvo);
		session.update("sitterBoardMapper.editMember",sbvo);
	}

	@Override
	public void updateImage(String image) throws Exception {
		session.update("sitterBoardMapper.editImage",image);
	}

}
