package com.kh.adopt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.shelter.model.service.ShelterService;
import com.kh.shelter.model.vo.Shelter;

/**
 * Servlet implementation class AdoptWrittenController
 */
@WebServlet("/written.ad")
public class AdoptWrittenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptWrittenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 여기에서 뭔가를 가져다가 글쓰는 form jsp에 보호소 명을 뿌릴 수 있어야 하지 않나,,,?
		// 보호소 객체를 갖고 있어야 이거를 수정하던가 하지!!
		
		ArrayList<Shelter> Shelters = new ShelterService().selectAllShelters();
		if(Shelters == null) { // Shelters list가 생성되지 않는 경우
			request.setAttribute("errorMsg", "보호소 조회에 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}else { //Shelters list가  생성된 경우 
			
			request.setAttribute("Shelters", Shelters);
		    request.getRequestDispatcher("views/adopt/adoptWrittenPage.jsp").forward(request,response);
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
