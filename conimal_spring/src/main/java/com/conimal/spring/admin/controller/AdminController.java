package com.conimal.spring.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.common.template.Pagination;
import com.conimal.spring.member.model.service.MemberService;
import com.conimal.spring.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("list.me")
	public String selectMemberList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage){
		int listCount = mService.selectMemberListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> mList = mService.selectMemberList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		return "admin/memberListView";
	}
	
	@RequestMapping("detail.me")
	public String selectMemberDetail(Model model, int mno) {
		Member m = mService.selectMemberDetail(mno);
		model.addAttribute("m", m);
		return "admin/memberDetailView";
	}
	
}
