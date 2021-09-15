package com.pet.sitter.dao;

import com.pet.sitter.vo.PetInfoVO;

public interface PetInfoDAO {
	
	
	//프로필 쓰기
		public void infoWrite(PetInfoVO pvo)throws Exception;
		
		//프로필 수정
		public void infoUpdate(PetInfoVO pvo)throws Exception;
		
		//프로필 읽기
		public PetInfoVO infoRead(String user_email)throws Exception;
		
		//프로필 삭제
		public void infoDelete(PetInfoVO pvo)throws Exception;

}
