package com.conimal.spring.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conimal.spring.member.model.service.MemberService;
import com.conimal.spring.member.model.vo.Member;

@Controller
public class CommonController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public String loginMember(HttpSession session, String memId, String memPwd) {
		Member m = new Member();
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		Member loginUser = mService.selectLoginMember(m);
		loginUser.setMemId(memId);
		loginUser.setMemPwd(memPwd);
		session.setAttribute("loginUser", loginUser);
		return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
}
