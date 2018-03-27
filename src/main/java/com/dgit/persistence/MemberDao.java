package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.MemberVO;

public interface MemberDao {
	public MemberVO selectById(String id) throws Exception;
	public void insert(MemberVO vo) throws Exception;
	public void addAttach(String fullName, int mno) throws Exception;
	public List<String> getAttach(int mno) throws Exception;
	public void deleteAttach(String filename) throws Exception;
}
