package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.BlogDAO;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;

@Service
public class BlogServiceImpl implements BlogService {

	@Inject
	BlogDAO dao;
	
	@Override
	public void write(BlogVO blogVO) throws Exception {

		dao.write(blogVO);
	}

	@Override
	public List<BlogVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public BlogVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void update(BlogVO blogVO) throws Exception {
		dao.update(blogVO);
	}

	@Override
	public void delete(int bno) throws Exception {

		dao.delete(bno);
	}

	@Override
	public void likeAdd(BlogLikeVO likeVO) throws Exception {
		dao.likeAdd(likeVO);
	}
	
	@Override
	public void likeDelete(BlogLikeVO likeVO) throws Exception{
		dao.likeDelete(likeVO);
	}
	
	public int likeRead(BlogLikeVO likeVO) throws Exception{
		return dao.likeRead(likeVO);
	}
}
