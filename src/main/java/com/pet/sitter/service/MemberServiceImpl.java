package com.pet.sitter.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.sitter.dao.MemberDAO;
import com.pet.sitter.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO mdao;

	@Override
	public void memberRegister(MemberVO mvo) throws Exception {
		mdao.memberRegister(mvo);
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) throws Exception {
		return mdao.memberLogin(mvo);
	}

	@Override
	public int memberEmailChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		int result = mdao.memberEmailChk(mvo);
		return result;
	}

	@Override
	public int memberPhoneChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		int result = mdao.memberPhoneChk(mvo);
		return result;
	}
	
	
	
	
	
}
