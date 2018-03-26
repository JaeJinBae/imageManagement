package com.dgit.service;

import java.util.List;

import com.dgit.domain.MemberVO;

public interface MemberService {
	public MemberVO selectById(String id) throws Exception;
	public void insert(MemberVO vo) throws Exception;
	public void addAttach(String fullName, int bno) throws Exception;
	public List<String> getAttach(int bno) throws Exception;
	public void deleteAttach(int bno) throws Exception;
}
