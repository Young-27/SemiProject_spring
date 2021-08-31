package com.conimal.spring.member.model.service;

import java.util.ArrayList;

import com.conimal.spring.member.model.vo.Member;

public interface MemberService {
	
	public ArrayList<Member> selectMemberList();
}
