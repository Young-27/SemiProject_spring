package com.conimal.spring.member.model.service;

import java.util.ArrayList;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 회원 조회
	public Member selectLoginMember(Member m);
	
	// 회원 리스트 조회 (관리자)
	public int selectMemberListCount();
	public ArrayList<Member> selectMemberList(PageInfo pi);
	
}
