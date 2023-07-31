package com.peco.service;

import org.springframework.stereotype.Service;

import com.peco.vo.MemberVO;

@Service
public interface MemberService {
	public MemberVO login(MemberVO member);
	public int insert(MemberVO member);
	public int idCheck(MemberVO member);
	public int nicknameCheck(MemberVO member);
}
