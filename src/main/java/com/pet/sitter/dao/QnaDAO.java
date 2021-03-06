package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.QnaVO;
import com.pet.sitter.vo.SearchCriteria;

public interface QnaDAO {

	//qna 작성
	public void qnaWrite(QnaVO qnaVO) throws Exception;

	//qna 목록 조회
	public List<QnaVO> list(SearchCriteria scri) throws Exception;

	//qna 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	//qna 조회
	public QnaVO qnaRead(int qno) throws Exception;

	//qna 수정
	public void qnaUpdate(QnaVO qnaVO) throws Exception;

	//qna 삭제
	public void qnaDelete(int qno) throws Exception;

}
