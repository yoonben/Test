package com.peco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.peco.mapper.MemberMapper;
import com.peco.service.MemberService;
import com.peco.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public MemberVo login(MemberVo paramMember) {
		MemberVo member = memberMapper.login(paramMember);
		
		if(member != null) {
			// 사용자가 입력한 비밀번호가 일치하는지 확인
			// 사용자가 입력한 비밀번호, 데이터베이스에 암호돠되어 저장된 비밀번호
			boolean res = encoder.matches(paramMember.getPw(), member.getPw());
			
			return member;
		}
		
		return null;
	}

	

	@Override
	public int insert(MemberVo member) {

		member.setPw(encoder.encode(member.getPw()));
		
		return memberMapper.insert(member);
	}



	@Override
	public int idCheck(MemberVo member) {
		
		return memberMapper.idCheck(member);
	}



	@Override
	public int nicknameCheck(MemberVo member) {
		// TODO Auto-generated method stub
		return memberMapper.nicknameCheck(member);
	}

}
