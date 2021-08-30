package com.kh.animal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.animal.model.service.AnimalService;
import com.kh.animal.model.vo.Animal;
import com.kh.attachment.model.vo.Attachment;

/**
 * Servlet implementation class AnimalUpdateFormController
 */
@WebServlet("/updateForm.ao")
public class AnimalUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int anNo = Integer.parseInt(request.getParameter("ano"));
		
		Animal a = new AnimalService().selectAnimal(anNo);
		Attachment at = new AnimalService().selectAttachment(anNo);
		request.setAttribute("a", a);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/animal/animalUpdateForm.jsp").forward(request, response);
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
