package com.acms.dao;

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

	public int addInterviewer(InterviewerPojo pp) {
		int result = 0;
		try {
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
	}

}
