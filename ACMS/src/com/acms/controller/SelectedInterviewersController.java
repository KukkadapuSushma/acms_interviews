package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acms.dao.*;
import com.acms.pojo.*;

public class SelectedInterviewersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectedInterviewersController() {
        super();
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("in Candidatescheduled controller");
		try {			
			String[] check = request.getParameterValues("check");
			InterviewerDAO tdao = new InterviewerDAO();
			if(check.length != 0){
				for(int i = 0; i < check.length;i++){
					InterviewerPojo tbean = tdao.getInterviewerDetails(check[i]);
					System.out.println("canpo"+check[i]);
					int result1 = tdao.scheduleInterviewer(check[i],tbean.getLevel());
					System.out.println("inserted to can1"+check[i]);
					}
				}
			try {
				//int partner_id;
				ScheduleDAO cdao = new ScheduleDAO();	
				int result = cdao.createSchedule();
				System.out.println(result);
				if(result > 0) {
						response.sendRedirect("schedule.jsp");
						System.out.println("record inserted into db");
					}
					else {
						String msg = "Please select interviewers again.";
				    	response.sendRedirect("homeView.jsp?msg="+msg);
					}
					
			} catch (NullPointerException e) {
				System.out.println("null pointer exception");
			}
			//response.sendRedirect("scheduleView.jsp");
		}catch (NullPointerException e) {
			 out.println("<script type = \"text/javascript\">");
			 out.println("alert('No Candidates are selected');");
			 out.println("location='scheduleView.jsp");
			 out.println("</script>");
			 e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			out.println("<script type = \"text/javascript\">");
			 out.println("alert('No Candidates are selected');");
			 out.println("location='scheduleView.jsp");
			 out.println("</script>");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

}
