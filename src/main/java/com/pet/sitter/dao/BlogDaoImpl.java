package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;

@Repository
public class BlogDaoImpl implements BlogDAO {

	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public void write(BlogVO blogVO) throws Exception {
		sqlSession.insert("blogMapper.insert", blogVO);
	}

	@Override
	public List<BlogVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("blogMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("blogMapper.listCount", scri);
	}

	@Override
	public BlogVO read(int bno) throws Exception {
		return sqlSession.selectOne("blogMapper.read", bno);
	}

	@Override
	public void update(BlogVO blogVO) throws Exception {

		sqlSession.update("blogMapper.update", blogVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("blogMapper.delete", bno);
	}

	
	@Override
	public void likeAdd(BlogLikeVO likeVO) throws Exception {
		sqlSession.insert("blogMapper.likeAdd", likeVO);
	}
	
	public void likeDelete(BlogLikeVO likeVO) throws Exception{
		sqlSession.delete("blogMapper.likeDelete", likeVO);
	}

	@Override
	public int likeRead(BlogLikeVO likeVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("blogMapper.likeRead", likeVO);
	}
}
