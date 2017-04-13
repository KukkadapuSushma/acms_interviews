package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.acms.dao.AdminDAO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
			//read username and password
			System.out.println("in logincontroller");
			String user = request.getParameter("user");
			HttpSession session = request.getSession();
			if(session != null)
			session.setAttribute("U",user);
			String password = request.getParameter("password");
			session.setAttribute("P",password);
			//create object of UserDAO
				AdminDAO adao = new AdminDAO();
			System.out.println("created object adao");
			//call signup()
			boolean result = adao.login(user, password);
				
				
				
				HttpSession hs = request.getSession(false);
				//add name as session attribute
				hs.setAttribute("U", user);
			//redirect control to next page based on decision
				if(result){
					int res = adao.truncateTables();
					RequestDispatcher rd = request.getRequestDispatcher("mainView.jsp");
					rd.forward(request, response);
				}
				else{
					response.sendRedirect("loginView.jsp?error= Please check your username and password");
				}
				out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}