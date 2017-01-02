package com.acms.dao;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
public class AdminDAO {
	public static String username = null;
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	Statement st;
	public AdminDAO()
		throws ClassNotFoundException,SQLException{
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}
	
	public boolean login(String user, String password)
			throws ClassNotFoundException,SQLException{
			boolean result = false;
			System.out.println("in admin dao");
			pst =  con.prepareStatement("Select login_id, aes_decrypt(password,'qwerty') from login where login_id = '" + user + "'");
			//System.out.println(pst);
			ResultSet r  =  pst.executeQuery();
			if(r.next()){
				if(r.getString(2).equals(password)){
					result = true;
					AdminDAO.username = user ;
					System.out.println(username);
				}else{
					result = false;
				}
			}
			else{
				System.out.println("please enter correct login id/ password");
			}
			return result;
		}	
}

