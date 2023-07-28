package com.peco.service;

import org.springframework.stereotype.Service;

import com.peco.vo.MemberVo;

@Service
public interface MemberService {
	public MemberVo login(MemberVo member);
}
