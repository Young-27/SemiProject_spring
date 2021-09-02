package com.conimal.spring.member.model.service;

import java.util.ArrayList;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 회원 조회
	public Member selectLoginMember(Member m);
	
	/*
	 *  관리자단 회원 -------------
	 * 
	 */
	// 회원 리스트 조회 
	public int selectMemberListCount();
	public ArrayList<Member> selectMemberList(PageInfo pi);
	// 회원 상세 조회
	public Member selectMemberDetail(int mno);
	
	// 회원 정보 수정/삭제
	public int adminUpdateMember(Member m);
	public int adminDeleteMember(int mno);
	
	/*
	 *  관리자단 회원 끝 -------------------------
	 */
	
}
