package com.conimal.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conimal.spring.member.model.dao.MemberDao;
import com.conimal.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Member> selectMemberList(){
		return mDao.selectMemberList(sqlSession);
	}

}
