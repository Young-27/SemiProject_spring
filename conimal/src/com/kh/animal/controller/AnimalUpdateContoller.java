package com.kh.animal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.animal.model.service.AnimalService;
import com.kh.animal.model.vo.Animal;

/**
 * Servlet implementation class AnimalUpdateContoller
 */
@WebServlet("/update.ao")
public class AnimalUpdateContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalUpdateContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int anNo = Integer.parseInt(request.getParameter("anNo"));
		String anTitle = request.getParameter("title");
		String anPlace = request.getParameter("place");
		String anSpecies = request.getParameter("animal");
		String anGender = request.getParameter("gender");
		String anContent = request.getParameter("content");
	
		Animal a = new Animal();
		a.setAnTitle(anTitle);
		a.setAnPlace(anPlace);
		a.setAnSpecies(anSpecies);
		a.setAnGender(anGender);
		a.setAnContent(anContent);
		a.setAnNo(anNo);
		int result = new AnimalService().updateAnimal(a);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.ao?ano=" + anNo);
			
		}else {
			
			 request.setAttribute("errorMsg", "게시글 작성 실패..");
			 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
