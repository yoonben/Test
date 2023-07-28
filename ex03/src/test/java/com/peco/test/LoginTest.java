package com.peco.test;

import static org.junit.Assert.assertEquals;
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
	
	@Test
	public void insertTest() {
		MemberVo member = new MemberVo();
		
		member.setId("test1");
		member.setPw("1234");
		member.setMname("홍갈동");
		member.setMage("35");
		member.setMphone("01056767573");
		member.setEmail("test123@gmail.com");
		member.setNickname("tester123");
		
		System.out.println("==================================");
		
		int res = memberMapper.insert(member);
		assertEquals(1, res);
	}
	
	
}
