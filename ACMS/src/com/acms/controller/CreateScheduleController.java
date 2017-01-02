package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acms.dao.ScheduleDAO;

/**
 * Servlet implementation class CreateScheduleController
 */
public class CreateScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException, ClassNotFoundException, SQLException{
		try {
			//int partner_id;
			ScheduleDAO cdao = new ScheduleDAO();	
			int result = cdao.createSchedule();
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

    public CreateScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
