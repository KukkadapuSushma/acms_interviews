package com.acms.dao;

import com.acms.pojo.CandidatePojo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CandidateDAO {

	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	ResultSet rs;

	public CandidateDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	public int addCandidate(CandidatePojo pp) {
		try {
		int result = 0;
		try {
			pst =  con.prepareStatement("insert into candidate values('"+pp.getName()+"','"+pp.getGender()+"','"+pp.getEmail()+"','"+pp.getPhone()+"','"+pp.getQuali()+"','"+pp.getLevel()+"','"+0+"')");
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
		}
	}
	
	public CandidatePojo getTraineeDetails(String name) throws SQLException {
		try{
	    pst = con.prepareStatement("select * from candidate where name = ?");
	    pst.setString(1, name);
	    ResultSet rs = pst.executeQuery();
	    CandidatePojo tbean = null;
	    if(rs.next()) {
	        tbean = new CandidatePojo(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
        } 
	    return tbean;
		}finally{
			//con.close();
		}
	}
	
	public int scheduleCandidate(String name,int level) throws SQLException, ClassNotFoundException, IOException{
		try{
		int result = 0;
		try {
			pst =  con.prepareStatement("insert into candidate1 values('"+name+"','"+level+"')");
			result = pst.executeUpdate();
			pst =  con.prepareStatement("update candidate set status = 1 where name = '"+name+"'");
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