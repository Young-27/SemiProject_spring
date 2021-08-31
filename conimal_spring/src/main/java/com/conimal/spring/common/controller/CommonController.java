package com.conimal.spring.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conimal.spring.member.model.vo.Member;

@Controller
public class CommonController {
	
	@RequestMapping("login.me")
	public String loginMember(HttpSession session, String memId, String memPwd) {
		Member loginUser = new Member();
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
