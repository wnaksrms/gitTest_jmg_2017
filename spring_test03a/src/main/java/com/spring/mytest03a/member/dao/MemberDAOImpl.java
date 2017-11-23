package com.spring.mytest03a.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.mytest03a.member.dto.MemberDTO;
@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	SqlSession sqlSession;
	
	public List selectList() throws DataAccessException{
		List memList=(List)sqlSession.selectList("member.selectAllMemberList");
		return memList;
		
	}
	public boolean overlapped(String id) throws DataAccessException{
		String temp=sqlSession.selectOne("member.overlapped",id);
		boolean result=Boolean.parseBoolean(temp);
		return result;
	}
	public void addMember(MemberDTO memberDTO) throws DataAccessException{
		sqlSession.insert("member.addMember",memberDTO);
	}
	public MemberDTO detail(String id) throws DataAccessException{
		MemberDTO memberDTO=(MemberDTO)sqlSession.selectOne("member.detail",id);
		return memberDTO;
	}
	public void modMember(MemberDTO memberDTO) throws DataAccessException{
		sqlSession.update("member.modMember",memberDTO);
		
	}
	public void delMember(String id) throws DataAccessException{
		sqlSession.delete("member.delMember",id);
	}
	public boolean login(MemberDTO memberDTO) throws DataAccessException{
		String temp=(String)sqlSession.selectOne("member.login",memberDTO);
		boolean result=Boolean.parseBoolean(temp);
		return result;
	}

}
