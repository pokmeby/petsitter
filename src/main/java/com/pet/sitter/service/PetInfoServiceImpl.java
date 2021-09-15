package com.pet.sitter.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.PetInfoDAO;
import com.pet.sitter.vo.PetInfoVO;

@Service
public class PetInfoServiceImpl implements PetInfoService{
	
	@Inject PetInfoDAO pdao;

	//프로필 작성
	@Override
	public void infoWrite(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.infoWrite(pvo);
	}

	//프로필 수정
	@Override
	public void infoUpdate(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.infoUpdate(pvo);
	}

	//프로필 조회
	@Override
	public PetInfoVO infoRead(String user_email) throws Exception {
		// TODO Auto-generated method stub
		return pdao.infoRead(user_email);
	}

	@Override
	public void infoDelete(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.infoDelete(pvo);
		
	}

	
	
	
	
	
	

}
