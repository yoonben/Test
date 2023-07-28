package com.peco.test;

import static org.junit.Assume.assumeNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.peco.mapper.MemberMapper;
import com.peco.vo.MemberVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LoginTest {
	@Autowired
	MemberMapper memberMapper;
	
	@Test
	public void test(){
		assumeNotNull(memberMapper);
		MemberVo member = new MemberVo();
		member.setId("test");
		member.setPw("1234");
		System.out.println("========================"+member.getId());
		memberMapper.login(member);

	}
	
	
}
