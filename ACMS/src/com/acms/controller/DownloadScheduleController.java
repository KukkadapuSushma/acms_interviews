package com.acms.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acms.dao.*;


public class DownloadScheduleController extends HttpServlet {
	    Connection con;
		private static final long serialVersionUID = 1L;
	       
	    public DownloadScheduleController() {
	    	super();
	    	// TODO Auto-generated constructor stub
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
		
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/csv");
		    response.setHeader("Content-Disposition", "attachment; filename=\"Schedule.csv\"");
			try {
                ConnectionDAO cdao = new ConnectionDAO();
				con = cdao.getConnection();
				java.util.Date uDate = new java.util.Date();
				DateFormat df = new SimpleDateFormat("YYYY-MM-dd");
				String sDate = df.format(uDate);
			    PreparedStatement pst = con.prepareStatement("select s.candidate,s.interviewer,sl.time,s.level from scheduler s,slots sl where s.slot = sl.slot and s.date = '"+sDate+"' order by(s.slot)");
			    ResultSet rs = pst.executeQuery();
			    OutputStream outputstream = response.getOutputStream();
			    outputstream.write(("\n"+"Schedule for "+sDate+","+"\n"+"\n").getBytes());
			    outputstream.write(("\n"+"Time Slot"+","+"Candidate Name"+","+"Interviewer Name"+","+"Level"+"\n").getBytes());
		    	while(rs.next()) {
		    		outputstream.write(("\n"+rs.getString(3)+","+rs.getString(1)+","+rs.getString(2)+","+rs.getString(4)+"\n").getBytes());
			    }
			}
			catch(ClassNotFoundException | SQLException e) {	  
			}
		}
}