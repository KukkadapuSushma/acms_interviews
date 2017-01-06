package com.acms.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acms.dao.ScheduleDAO;


public class feedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException, ClassNotFoundException, SQLException{
		try {
			String i_id = request.getParameter("i_name");
			String feed = request.getParameter("feed");
			String res = request.getParameter("result");
			ScheduleDAO cdao = new ScheduleDAO();	
			int result = cdao.setFeedback(i_id,feed,res);
			System.out.println(result);
			if(result > 0) {
					String msg = "Created Successfully";
					response.sendRedirect("schedule.jsp?msg="+msg);
					System.out.println("record inserted into db");
				}
				else {
			    	response.sendRedirect("homeView.jsp");
				}
				
		} catch (NullPointerException e) {
			System.out.println("null pointer exception");
		}
	}	 


    public feedbackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
