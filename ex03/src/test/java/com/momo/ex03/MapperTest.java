package com.momo.ex03;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.SampleMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MapperTest {
	
	@Autowired
	SampleMapper sampleMapper;
	
	@Test
	public void test() {
		assertNotNull(sampleMapper);
		System.out.println("getTime");
		System.out.println(sampleMapper.getTime());
		System.out.println("getTime2");
		System.out.println(sampleMapper.getTime2());
	}
}
