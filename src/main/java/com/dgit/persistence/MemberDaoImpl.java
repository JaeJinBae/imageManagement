package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String namespace="com.dgit.mappers.MemberMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public MemberVO selectById(String id) throws Exception {
		return session.selectOne(namespace+".selectById",id);
	}

	@Override
	public void insert(MemberVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void addAttach(String fullName, int mno) throws Exception {
		HashMap<String, Object> map=new HashMap<>();
		map.put("fullName", fullName);
		map.put("mno", mno);
		
		session.insert(namespace+".addAttach",map);
		
	}

	@Override
	public List<String> getAttach(int mno) throws Exception {
		return session.selectList(namespace+".getAttach",mno);
	}

	@Override
	public void deleteAttach(int mno) throws Exception {
		session.delete(namespace+".deleteAttach",mno);
		
	}

}
