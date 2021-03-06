package com.conimal.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.member.model.dao.MemberDao;
import com.conimal.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectMemberListCount() {
		return mDao.selectMemberListCount(sqlSession);
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		return mDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public Member selectLoginMember(Member m) {
		return mDao.selectLoginMember(sqlSession, m);
	}

	@Override
	public Member selectMemberDetail(int mno) {
		return mDao.selectMemberDetail(sqlSession, mno);
	}

	@Override
	public int adminUpdateMember(Member m) {
		return mDao.adminUpdateMember(sqlSession, m);
	}

	@Override
	public int adminDeleteMember(int mno) {
		return mDao.adminDeleteMember(sqlSession, mno);
	}

	@Override
	public int adminUpdateShelter(Member m) {
		return mDao.adminUpdateMember(sqlSession, m);
	}
	
	

}
