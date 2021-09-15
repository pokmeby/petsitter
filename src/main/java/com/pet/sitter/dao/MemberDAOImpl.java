package com.pet.sitter.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession membersql;
  
	@Override
	public void memberRegister(MemberVO mvo) throws Exception {
		
		membersql.insert("memberMapper.memberRegister", mvo);
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) throws Exception {
		return membersql.selectOne("memberMapper.memberLogin", mvo);
	}

	@Override
	public int memberEmailChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberemailChk" , mvo);
	
	}

	@Override
	public int memberPhoneChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberphoneChk" , mvo);
	}
	
	


	

}
