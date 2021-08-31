package com.conimal.spring.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conimal.spring.member.model.service.MemberService;
import com.conimal.spring.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("list.me")
	public String selectMemberList(Model model){
		ArrayList<Member> mList = mService.selectMemberList();
		model.addAttribute("mList", mList);
		return "admin/memberListView";
	}
	
}
