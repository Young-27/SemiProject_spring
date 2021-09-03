package com.conimal.spring.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.member.model.vo.Member;

@Repository
public class MemberDao {
	public int selectMemberListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemberListCount");
	}
	public ArrayList<Member> selectMemberList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}
	
	public Member selectLoginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectLoginMember", m);
	}
	
	public Member selectMemberDetail(SqlSession sqlSession, int mno) {
		return sqlSession.selectOne("memberMapper.selectMemberDetail", mno);
	}
	
	public int adminUpdateMember(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.adminUpdateMember", m);
	}
	
	public int adminDeleteMember(SqlSession sqlSession, int mno) {
		return sqlSession.delete("memberMapper.adminDeleteMember", mno);
	}
	
	public int adminUpdateShelter(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.adminUpdateShelter", m);
	}
}
