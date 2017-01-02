package com.acms.dao;

import com.acms.pojo.CandidatePojo;

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
		int result = 0;
		try {
			pst =  con.prepareStatement("insert into candidate values('"+pp.getName()+"','"+pp.getGender()+"','"+pp.getEmail()+"','"+pp.getPhone()+"','"+pp.getQuali()+"','"+pp.getLevel()+"')");
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