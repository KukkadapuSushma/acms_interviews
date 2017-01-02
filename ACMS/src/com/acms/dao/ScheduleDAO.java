package com.acms.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acms.pojo.CandidatePojo;

public class ScheduleDAO {
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst,pst1;
	ResultSet rs,rs1;

	public ScheduleDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	public int createSchedule() {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			pst1 = con.prepareStatement("select Name,email,level from interviewer");
			rs1 = pst1.executeQuery();
			for(int slot = 1;slot < 8;slot++){
				while(rs1.next()){
					pst =  con.prepareStatement("select name,mobile,level from candidate");
					rs=pst.executeQuery();
					int st = 9;int et = 10,j=0;
					while(rs.next()){
						int i = 0;
						if(rs1.getInt("level") >= rs.getInt("level") && rs.getInt("level") < 5 && i < 5){
							i++;
							j++;
							pst = con.prepareStatement("insert into schedule_interview(email_ifk, mobile_fk, startTime, endTime) values('"+rs1.getString("email")+"','"+rs.getString("mobile")+"','"+st+"','"+et+"')");
							int ans = pst.executeUpdate();
							if(ans > 0){
								pst1 = con.prepareStatement("update candidate set level = level+1 where mobile = " +rs.getString("mobile")); 
								int inc = pst1.executeUpdate();
							}
						}
						st++;
						et++;
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<CandidatePojo> getSchedule() throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
		try {
			pst =  con.prepareStatement("select s.interview_id,i.Name,c.name,s.startTime,s.endTime from schedule_interview s,candidate c,interviewer i where s.email_ifk = i.email and c.mobile = s.mobile_fk");
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 while(rs.next()) {
			 int interview_id = rs.getInt(1);
			 String interviewer = rs.getString(2);	
			 String candidate = rs.getString(3);
			 String st = rs.getString(4);
			 String et = rs.getString(5);
			 bean = new CandidatePojo("",interviewer,candidate,st,et,interview_id);
			 cc.add(bean);
		 
		 }	 
		return  cc;
	}
}
