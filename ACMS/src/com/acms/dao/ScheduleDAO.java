package com.acms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.acms.pojo.*;

public class ScheduleDAO {
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst,pst1,pst2,pst3,pst4,pst5,pst6,pst7;
	ResultSet rs,rs1,rs2,rs4,rs5,rs6;

	public ScheduleDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	public int createSchedule() {
		// TODO Auto-generated method stub
		int result = 1;
		try {			
			int j;
			pst =  con.prepareStatement("select name,mobile,level from candidate");
			rs=pst.executeQuery();
			int k =1;
			System.out.println("please come");
			while(rs.next()){
				if(k<100){
						if(k%4 == 0){
							j = 4;
						} 
						else{ 
							j = k%4; 
						} 
						int slot = j;
						System.out.println(slot);
						while(slot<10){ 
							
							pst1 = con.prepareStatement("select Name,email,level from interviewer order by level");
							rs1 = pst1.executeQuery();
							
							while(rs1.next()){
								String name = rs.getString("name");
								System.out.println(name);
								pst4 = con.prepareStatement("select level,name from candidate where name = '"+name+"'");
								rs4 = pst4.executeQuery();
								String interviewer = rs1.getString("Name");
								pst6 = con.prepareStatement("select var from interviewer where name = '"+interviewer+"' " );
								rs5 = pst6.executeQuery();
								while(rs4.next()){
									
									while(rs5.next()){
										if(rs1.getInt("level") >= rs4.getInt("level") && rs.getInt("level") < 4 && rs5.getInt("var") < 5){
											pst2 = con.prepareStatement("insert into schedule_interview(email_ifk, mobile_fk,slot) values('"+rs1.getString("email")+"','"+rs.getString("mobile")+"','"+(slot++)+"')");
											int ans = pst2.executeUpdate();
											if(ans >0){
												pst3 = con.prepareStatement ("update candidate set level = level+1 where name = ?"); 
												pst3.setString(1, name);
												pst3.executeUpdate();
												pst5 = con.prepareStatement("update interviewer1 set var = var + 1 where name = ?");
												pst5.setString(1, rs1.getString("Name"));
												pst5.executeUpdate();
											}								
									  }	
									}
								}	
							}
								slot = slot + 1;
						}
					}
					k=k+1;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public  ArrayList<interviewPojo> findInterviewes() throws SQLException{
		ArrayList<interviewPojo> listOfinterviewes = new ArrayList<interviewPojo>();
		

				pst7 = con.prepareStatement("select s.interview_id,i.Name,c.name,s.slot,c.level from schedule_interview s,candidate c,interviewer i where s.email_ifk = i.email and c.mobile = s.mobile_fk");
				rs6 = pst7.executeQuery();

				
				while(rs6.next())
		        {
					interviewPojo userpojo  = new interviewPojo();
					userpojo.setid(rs6.getInt("s.interview_id"));
					userpojo.setcandidate(rs6.getString("c.name"));
					userpojo.setinterviewer(rs6.getString("i.Name"));
					userpojo.setlevel(rs6.getInt("c.level"));
					userpojo.setslot(rs6.getInt("s.slot"));
					listOfinterviewes.add(userpojo);
		        }
		
		return listOfinterviewes;
	
}
	
/*	public int createSchedule() {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			pst1 = con.prepareStatement("select Name,email,level from interviewer");
			rs1 = pst1.executeQuery();
			for(int slot = 1;slot < 8;slot++){
				while(rs1.next()){
					int max_si = 0;
					pst =  con.prepareStatement("select name,mobile,level from candidate");
					rs=pst.executeQuery();
					int st = 9;int et = 10;
					while(rs.next()){
						if(rs1.getInt("level") >= rs.getInt("level") && rs.getInt("level") < 4 && max_si < 4 && st < 17 && et < 18){
							max_si++;
							pst = con.prepareStatement("insert into schedule_interview(email_ifk, mobile_fk, startTime, endTime) values('"+rs1.getString("email")+"','"+rs.getString("mobile")+"','"+st+"','"+et+"')");
							int ans = pst.executeUpdate();
							if(ans > 0){
								pst1 = con.prepareStatement("update candidate set level = level+1 where mobile = " +rs.getString("mobile")); 
								pst1.executeUpdate();
							}
						}
						st++;
						et++;
						if(st == 13 && et == 14){
							st++;
							et++;
						}
					}
				}
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
*/	
	public ArrayList<CandidatePojo> getSchedule() throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
		try {
			pst =  con.prepareStatement("select s.interview_id,i.Name,c.name,s.startTime,s.endTime,c.level from schedule_interview s,candidate c,interviewer i where s.email_ifk = i.email and c.mobile = s.mobile_fk");
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
			 String level = rs.getString(6);
			 bean = new CandidatePojo(level,interviewer,candidate,st,et,interview_id);
			 cc.add(bean);
		 
		 }	 
		return  cc;
	}

	public ArrayList<CandidatePojo> getFeedback(String c_name) throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
		try {
			pst = con.prepareStatement("select i.Name,r.level,r.result,r.feedback from interviewer i,interview_review r,candidate c where c.mobile = r.mobile_fk and i.email = r.email_ifk and c.name = '"+c_name+"' order by level");
			System.out.println(pst);
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NullPointerException e){
				return null;
			}
		 while(rs.next()) {
			 String name = rs.getString("i.name");
			 String level = rs.getString("r.level");	
			 String result = rs.getString("r.result");
			 String feedback = rs.getString("r.feedback");
			 bean = new CandidatePojo(name,level,result,feedback,"",0);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	
	public ArrayList<CandidatePojo> getFeedbackI(String i_name) throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
		try {
			pst = con.prepareStatement("select c.Name,r.level,r.result,r.feedback from interviewer i,interview_review r,candidate c where c.mobile = r.mobile_fk and i.email = r.email_ifk and i.name = '"+i_name+"' order by level");
			System.out.println(pst);
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NullPointerException e){
				return null;
			}
		 while(rs.next()) {
			 String name = rs.getString("c.Name");
			 String level = rs.getString("r.level");	
			 String result = rs.getString("r.result");
			 String feedback = rs.getString("r.feedback");
			 bean = new CandidatePojo(name,level,result,feedback,"",0);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	
	public int setFeedback(String i_id, String feed, String res) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			pst1 =  con.prepareStatement("select email_ifk,mobile_fk from schedule_interview where interview_id=" +i_id);
			rs1 = pst1.executeQuery();
			System.out.println(pst1);
			rs1.next();
			String email = rs1.getString("email_ifk");
			String mobile = rs1.getString("mobile_fk");
			pst1 = con.prepareStatement("select level from candidate where mobile=" +mobile);
			rs1 = pst1.executeQuery();
			System.out.println(pst1);
			rs1.next();
			int level = Integer.parseInt(rs1.getString("level")); 
			pst =  con.prepareStatement("insert into interview_review values('"+email+"','"+mobile+"','"+level+"','"+res+"','"+feed+"')");
			System.out.println(pst);
			result=pst.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<CandidatePojo> getAllDistinctCandidates() throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
	    pst = con.prepareStatement("select Distinct(name) from candidate order by name");
	    System.out.println(pst);
	    ResultSet rs = pst.executeQuery();
	    while(rs.next()) {
			 String name = rs.getString(1);
			 bean = new CandidatePojo(name,"","","","",0);
			 cc.add(bean);
		 }	 		
	    return cc;
}
	
	public ArrayList<CandidatePojo> getAllDistinctInterviewers() throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
	    pst = con.prepareStatement("select Distinct(name) from interviewer order by name");
	    System.out.println(pst);
	    ResultSet rs = pst.executeQuery();
	    while(rs.next()) {
			 String name = rs.getString(1);
			 bean = new CandidatePojo(name,"","","","",0);
			 cc.add(bean);
		 }	 		
	    return cc;
}
}
