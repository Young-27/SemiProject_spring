package com.conimal.spring.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.conimal.spring.member.model.vo.Member;

@Repository
public class MemberDao {
	public ArrayList<Member> selectMemberList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	}
}
