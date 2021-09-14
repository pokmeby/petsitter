package com.pet.sitter.service;

import com.pet.sitter.vo.MemberVO;

public interface MemberService {
	
	public void memberRegister(MemberVO mvo) throws Exception;
	
	public MemberVO memberLogin(MemberVO mvo)throws Exception;
	
	public int memberEmailChk(MemberVO mvo) throws Exception;
	
	public int memberPhoneChk(MemberVO mvo) throws Exception;

	
}
