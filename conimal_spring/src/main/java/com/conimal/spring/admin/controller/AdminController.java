package com.conimal.spring.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conimal.spring.board.model.vo.Board;
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
	
	@RequestMapping("update.adme")
	public String updateMember(Model model, Member m, HttpSession session) {
		if(m.getMemCode() == 2) { // 보호소라면
			int result1 = mService.adminUpdateShelter(m);
			
			if(result1 > 0) {
				session.setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			}else {
				session.setAttribute("alertMsg", "회원 정보 수정 실패!!!");
			}
		}else { // 보호소가 아니라면
			int result2 = mService.adminUpdateMember(m);
			
			if(result2 > 0) {
				session.setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			}else {
				session.setAttribute("alertMsg", "회원 정보 수정 실패!!!");
			}
		}
		
		return "redirect:/detail.me?mno=" + m.getMemNo();
	}
	
	@RequestMapping("delete.adme")
	public String deleteMember(int memNo, Model model, HttpSession session) {
		int result = mService.adminDeleteMember(memNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "회원 정보가 삭제되었습니다.");
		}else {
			session.setAttribute("alertMsg", "회원 정보 삭제 실패!!!!!");
		}
		return "redirect:/list.me";
	}
	
	@RequestMapping("list.bo")
	public String selectBoardList(Model model) {
		ArrayList<Board> bList = bServcie.selectBoardList();
		return "admin/boardListBiew";
	}
	
}
