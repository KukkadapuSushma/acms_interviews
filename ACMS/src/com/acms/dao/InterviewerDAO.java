package com.acms.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.acms.pojo.InterviewerPojo;

public class InterviewerDAO {

	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	ResultSet rs;

	public InterviewerDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	public int addInterviewer(InterviewerPojo pp) throws SQLException {
		try{
		int result = 0;
		try {
			int level = pp.getLevel();
			pst =  con.prepareStatement("insert into interviewer(Name,email,mobile,level) values('"+pp.getName()+"','"+pp.getEmail()+"','"+pp.getPhone()+"','"+pp.getLevel()+"')");
			//pst.setInt(1, pp.getPartner_id());
			result = pst.executeUpdate();
			System.out.println(pst);
		} catch (SQLException e) {
			System.out.println("in exception");
			e.printStackTrace();
			return result;
		}
		return result;
		}finally{
			//con.close();
		}
	}

	public InterviewerPojo getInterviewerDetails(String name) throws SQLException {
		try{
		pst = con.prepareStatement("select * from interviewer where name = ?");
		pst.setString(1, name);
		ResultSet rs = pst.executeQuery();
		    InterviewerPojo tbean = null;
		    if(rs.next()) {
		        tbean = new InterviewerPojo(rs.getString(1),rs.getInt(4),rs.getString(3),rs.getString(5));
	        } 
		    return tbean;
		}finally{
			//con.close();
		}
		}

	public int scheduleInterviewer(String name,int level) throws SQLException, ClassNotFoundException, IOException{
		try{
		int result = 0;
		try {
			pst =  con.prepareStatement("insert into interviewer1 values('"+name+"','"+level+"','"+1+"')");
			result = pst.executeUpdate();
			pst =  con.prepareStatement("update interviewer set status = 1 where name = '"+name+"'");
			result = pst.executeUpdate();
			System.out.println(pst);
		} catch (SQLException e) {
			System.out.println("in exception");
			e.printStackTrace();
			return result;
		}
		return result;
		}finally{
			//con.close();
		}
	}
	}
