package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.acms.dao.CandidateDAO;
import com.acms.pojo.CandidatePojo;

public class AddCandidateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException, ClassNotFoundException, SQLException{
		try {
			//int partner_id;
			String Name = request.getParameter("name_c");
			String Gender = request.getParameter("gender");
			String Quali = request.getParameter("qualification");
			String Email = request.getParameter("email");
			String Phone = request.getParameter("phone");
			int level = 0;
			System.out.println(Name+"jhbd\n");
			CandidatePojo pp = new CandidatePojo(Name, Gender, Quali, Email, Phone, level);
			CandidateDAO cdao = new CandidateDAO();	
			int result = cdao.addCandidate(pp);
		    //partner_id = result;
			System.out.println(result);
			if(result > 0) {
					String msg = "Candidate details added successfully";
					response.sendRedirect("addCandidate.jsp?msg="+msg);
					System.out.println("record inserted into db");
				}
				else {
					String msg = "Please enter the details again!!";
			    	response.sendRedirect("addCandidate.jsp?msg="+msg);
				}
		} catch (NullPointerException e) {
			System.out.println("null pointer exception");
		}
	}	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			doProcess(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			doProcess(request,response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

	}




}