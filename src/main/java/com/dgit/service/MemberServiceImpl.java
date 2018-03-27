package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberVO selectById(String id) throws Exception {
		return dao.selectById(id);
	}

	@Override
	public void insert(MemberVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void addAttach(String fullName, int mno) throws Exception {
		dao.addAttach(fullName, mno);
		
	}

	@Override
	public List<String> getAttach(int mno) throws Exception {
		return dao.getAttach(mno);
	}

	@Override
	public void deleteAttach(String filename) throws Exception {
		dao.deleteAttach(filename);
	}

}
