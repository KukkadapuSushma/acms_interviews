package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.acms.dao.InterviewerDAO;
import com.acms.pojo.InterviewerPojo;

public class AddInterviewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		try {
			int partner_id;
			String Name = request.getParameter("name");
			String Level = request.getParameter("level");
			String Phone = request.getParameter("phone");
			String Email = request.getParameter("email");
			System.out.println(Name+"jhbd\n");
			InterviewerPojo pp = new InterviewerPojo((Long)0L, Name, Level, Phone, Email);
			InterviewerDAO pdao = new InterviewerDAO();	
			int result = pdao.addInterviewer(pp);
		    partner_id = result;
			System.out.println(result);
			if(result > 0) {
					response.sendRedirect("addContact.jsp?partner_id="+partner_id+"&Name="+Name);
					System.out.println("record inserted into db");
				}
				else {
			    	response.sendRedirect("partnerView.jsp");
				}
				System.out.println("pop should be dispalyed");
				//response.sendRedirect("addPartner.jsp?error='errorissent'");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Partner you added exits! Add a NEW partner');");
				out.println("location='addPartner.jsp';");
				out.print("</script>");
		} catch (ClassNotFoundException e) {
			System.out.println("class not found exception");
		} catch (SQLException e) {
			System.out.println("sql exception");
		} catch (NullPointerException e) {
			System.out.println("null pointer exception");
		}
	}

	

	 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);

		

		

	

		

		

	}




	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);	

	}




}