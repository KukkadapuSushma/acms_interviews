package com.acms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acms.pojo.CandidatePojo;
import com.acms.dao.*;

public class CandidatesScheduled extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CandidatesScheduled() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("in Candidatescheduled controller");
		try {			
			String[] check = request.getParameterValues("check");
			CandidateDAO tdao = new CandidateDAO();
			if(check.length != 0){
				for(int i = 0; i < check.length;i++){
					CandidatePojo tbean = tdao.getTraineeDetails(check[i]);
					System.out.println("canpo"+check[i]);
					int result1 = tdao.scheduleCandidate(check[i],tbean.level);
					System.out.println("inserted to can1"+check[i]);
					}
				}
			String msg = "Candidates Selected for Scheduling!!";
			response.sendRedirect("scheduleView.jsp?msg="+msg);
		}catch (NullPointerException e) {
			 out.println("<script type = \"text/javascript\">");
			 out.println("alert('No Candidates are selected');");
			 out.println("location='scheduleView.jsp'");
			 out.println("</script>");
			 e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			out.println("<script type = \"text/javascript\">");
			 out.println("alert('No Candidates are selected');");
			 out.println("location='scheduleView.jsp'");
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
