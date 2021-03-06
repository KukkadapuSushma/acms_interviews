package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.acms.dao.InterviewerDAO;
import com.acms.pojo.InterviewerPojo;

public class AddInterviewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		try {
			String Name = request.getParameter("name");
			String level = request.getParameter("level");
			int Level = Integer.parseInt(level.trim());
			String Phone = request.getParameter("phone");
			String Email = request.getParameter("email");
			System.out.println(Name+"jhbd\n");
			InterviewerPojo pp = new InterviewerPojo(Name, Level, Phone, Email);
			InterviewerDAO pdao = new InterviewerDAO();	
			int result = pdao.addInterviewer(pp);
		    String error = "Please add again";
			System.out.println(result);
			if(result > 0) {
				String msg = "Interviewer details added successfully";
				response.sendRedirect("addInterviewer.jsp?msg="+msg);
				System.out.println("record inserted into db");
				}
				else {
					String msg = "Please enter the details again!!";
			    	response.sendRedirect("addInterviewer.jsp?error="+error);
				}
		} catch (NullPointerException e) {
			System.out.println("null pointer exception");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);	
	}
}