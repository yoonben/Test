package com.peco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.MemberMapper;
import com.peco.service.MemberService;
import com.peco.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public MemberVo login(MemberVo member) {
		// TODO Auto-generated method stub
		return memberMapper.login(member);
	}

}
