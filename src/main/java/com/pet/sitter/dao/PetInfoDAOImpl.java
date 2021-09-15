package com.pet.sitter.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.PetInfoVO;

@Repository
public class PetInfoDAOImpl implements PetInfoDAO{
	
	
	@Inject SqlSession sql;

	
	@Override
	public void infoWrite(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("petInfoMapper.infoWrite" ,  pvo);
	}

	@Override
	public void infoUpdate(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("petInfoMapper.infoUpdate" , pvo);
		
	}

	@Override
	public PetInfoVO infoRead(String user_email) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("petInfoMapper.infoRead" , user_email);
	}

	@Override
	public void infoDelete(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("petInfoMapper.infoDelete" , pvo);
	}
	
	
	
	
	

}
