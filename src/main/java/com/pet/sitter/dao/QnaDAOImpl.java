package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.pet.sitter.vo.QnaVO;
import com.pet.sitter.vo.SearchCriteria;

@Service
public class QnaDAOImpl implements QnaDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	//qna 작성
	@Override
	public void qnaWrite(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qnaMapper.insert", qnaVO);
	}

	//qna 목록 조회
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("qnaMapper.listPage", scri);
	}

	//qna 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("qnaMapper.listCount", scri);
	}
	
	//qna 조회
	@Override
	public QnaVO qnaRead(int qno) throws Exception {
		return sqlSession.selectOne("qnaMapper.read", qno);
	}
	
	//qna 수정
	@Override
	public void qnaUpdate(QnaVO qnaVO) throws Exception {
		sqlSession.update("qnaMapper.update", qnaVO);
	}
	
	//qna 삭제
	@Override
	public void qnaDelete(int qno) throws Exception {
		sqlSession.delete("qnaMapper.delete", qno);
	}
	
	

}
