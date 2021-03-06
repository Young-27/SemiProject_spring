package com.conimal.spring.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conimal.spring.board.model.vo.Board;
import com.conimal.spring.board.service.BoardService;
import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.common.template.Pagination;
import com.conimal.spring.customer.model.service.CustomerService;
import com.conimal.spring.customer.model.vo.Customer;
import com.conimal.spring.member.model.service.MemberService;
import com.conimal.spring.member.model.vo.Member;
import com.conimal.spring.report.model.service.ReportService;
import com.conimal.spring.report.model.vo.Report;

/**
 * @author 선영
 * 관리자 통합관리 페이지 기능이 담긴 Controller
 */
@Controller
public class AdminController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BoardService bService;
	@Autowired
	private ReportService rService;
	@Autowired
	private CustomerService cService;
	
	/**
	 * @return 회원 목록 조회
	 */
	@RequestMapping("list.me")
	public String selectMemberList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage){
		int listCount = mService.selectMemberListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> mList = mService.selectMemberList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		return "admin/memberListView";
	}
	
	/**
	 * @return 회원 상세조회
	 */
	@RequestMapping("detail.me")
	public String selectMemberDetail(Model model, int mno) {
		Member m = mService.selectMemberDetail(mno);
		model.addAttribute("m", m);
		System.out.println(mno);
		System.out.println(m);
		return "admin/memberDetailView";
	}
	
	/**
	 * @return 회원 정보 수정
	 */
	@RequestMapping("update.adme")
	public String updateMember(Model model, Member m, HttpSession session) {
		System.out.println(m);
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
	
	/**
	 * @return 회원 탈퇴
	 */
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
	
	/*
	 * @RequestMapping("search.me") public String searchMemberList(Model model,
	 * String keyword) { int listCount = mService.searchListCount(keyword);
	 * ArrayList<Member> mList = mService.searchMemberList(keyword);
	 * model.addAttribute("keyword", keyword); model.addAttribute("mList", mList);
	 * return "admin/memberListView"; }
	 * 
	 * @RequestMapping("search.bo") public String searchBoardList(Model model,
	 * String keyword) { int listCount = bService.searchListCount(keyword);
	 * ArrayList<Board> bList = bService.searchBoardList(keyword);
	 * model.addAttribute("keyword", keyword); model.addAttribute("bList", bList);
	 * return "admin/boardListView"; }
	 */
	
	
	/**
	 * @return 게시판 글 전체 조회
	 */
	@RequestMapping("list.bo")
	public String selectBoardList(Model model, 
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> bList = bService.selectBoardList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("bList", bList);
		return "admin/boardListView";
	}
	
	/**
	 * @return 신고 조회
	 */
	@RequestMapping("list.re")
	public String selectReportList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = rService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Report> rList = rService.selectReportList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);
		return "admin/reportListView";
	}
	
	/**
	 * @return 1:1문의 조회
	 */
	@RequestMapping("list.ca")
	public String selectCustomerList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model) {
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Customer> cList = cService.selectCustomerList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		return "admin/customerListView";
	}
	
	/**
	 * @return 1:1 문의 상세 조회
	 */
	@RequestMapping("detail.ca")
	public String selectCustomerDetail(int cno, Model model) {
		Customer c = cService.selectCustomerDetail(cno);
		model.addAttribute("cno", cno);
		model.addAttribute("c", c);
		return "admin/customerDetailView";
	}
	
	@RequestMapping("updateForm.an")
	public String answerUpdateForm(int cno, Model model) {
		Customer c = cService.selectCustomerDetail(cno);
		model.addAttribute("c", c);
		model.addAttribute("cno", cno);
		return "admin/customerAnswerUpdateForm";
	}
	
	
	
}
