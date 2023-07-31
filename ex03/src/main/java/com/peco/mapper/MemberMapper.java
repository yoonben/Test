package com.peco.mapper;

import com.peco.vo.MemberVo;

public interface MemberMapper {
	public MemberVo login(MemberVo member);
	public int insert(MemberVo member);
	public int idCheck(MemberVo member);
	public int nicknameCheck(MemberVo member);
	
}
