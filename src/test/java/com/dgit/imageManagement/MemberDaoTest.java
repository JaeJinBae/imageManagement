package com.dgit.imageManagement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDaoTest {

	@Autowired
	private MemberDao dao;
	
	//@Test
	public void insert() throws Exception{
		MemberVO vo= new MemberVO();
		vo.setMno(0);
		vo.setName("jj");
		vo.setId("bjj");
		vo.setPw("aaa");
		vo.setMail("as@asdf.com");
		vo.setPhone("123-123-1234");
		dao.insert(vo);
	}
	
	@Test
	public void selectById() throws Exception{
		dao.selectById("bjj");
	}
	
}
