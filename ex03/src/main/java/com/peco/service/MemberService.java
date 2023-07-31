package com.peco.service;

import org.springframework.stereotype.Service;

import com.peco.vo.MemberVo;

@Service
public interface MemberService {
	public MemberVo login(MemberVo member);
	public int insert(MemberVo member);
	public int idCheck(MemberVo member);
	public int nicknameCheck(MemberVo member);
}
