package com.acms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acms.pojo.CandidatePojo;
import com.acms.pojo.InterviewerPojo;
import com.acms.pojo.interviewPojo;

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
			pst =  con.prepareStatement("select name,level from candidate1");
			rs=pst.executeQuery();
			int k =1;
		
				System.out.println("please come");
				while(rs.next()){
					
					if(k<10){
						
						if(k%4 == 0){
							j = 4;
						} 
						else{ 
							j = k%4; 
						} 
						int slot = j;
						System.out.println(slot);
						while(slot<10){ 
							
							pst1 = con.prepareStatement("select name,level from interviewer1 order by level");
							rs1 = pst1.executeQuery();
							
							while(rs1.next()){
								
								String name = rs.getString("name");
								System.out.println(name);
								pst4 = con.prepareStatement("select level,name from candidate1 where name = '"+name+"'");
								rs4 = pst4.executeQuery();
								String interviewer = rs1.getString("name");
								pst6 = con.prepareStatement("select var from interviewer1 where name = '"+interviewer+"' " );
								rs5 = pst6.executeQuery();
								
								while(rs4.next()){
									
									while(rs5.next()){
										if(rs1.getInt("level") >= rs4.getInt("level") && rs.getInt("level") < 4 && rs5.getInt("var") < 5){
											pst2 = con.prepareStatement("insert into scheduler(candidate, interviewer, level, slot) values('"+rs.getString("name")+"','"+rs1.getString("name")+"','"+rs1.getInt("level")+"','"+(slot++)+"')");
											int ans = pst2.executeUpdate();
											
											if(ans >0){
												
												pst3 = con.prepareStatement ("update candidate1 set level = level+1 where name = ?"); 
												pst3.setString(1, name);
												pst3.executeUpdate();
												pst5 = con.prepareStatement("update interviewer1 set var = var + 1 where name = ?");
												pst5.setString(1, rs1.getString("name"));
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
			//}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
	public  ArrayList<interviewPojo> findInterviewes() throws SQLException{
	 	ArrayList<interviewPojo> listOfinterviewes = new ArrayList<interviewPojo>();
		

				pst7 = con.prepareStatement("select s.candidate,s.interviewer,s.level,i.time,s.interview_id from scheduler s , slots i where s.slot = i.slot order by s.slot");
				rs6 = pst7.executeQuery();

				
				while(rs6.next())
		        {
					interviewPojo userpojo  = new interviewPojo();
					userpojo.setid(rs6.getInt("s.interview_id"));
					userpojo.setcandidate(rs6.getString("candidate"));
					userpojo.setinterviewer(rs6.getString("interviewer"));
					userpojo.setlevel(rs6.getInt("level"));
					userpojo.setslots(rs6.getString("i.time"));
					listOfinterviewes.add(userpojo);
		        }
		
		return listOfinterviewes;
	
}


	public ArrayList<CandidatePojo> getCandidates() throws SQLException{
		ArrayList<CandidatePojo>  cc = new ArrayList<CandidatePojo>();
		CandidatePojo bean;
		try {
			pst = con.prepareStatement("select name,gender,qualification,level from candidate order by name");
			System.out.println(pst);																																																															
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NullPointerException e){
				return null;
			}
		 while(rs.next()) {
			 String name = rs.getString("name");
			 String gender = rs.getString("gender");	
			 String quali = rs.getString("qualification");
			 String level = rs.getString("level");
			 bean = new CandidatePojo(name,gender,quali,level,"",0);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	
	public ArrayList<InterviewerPojo> getInterviewers() throws SQLException{
		ArrayList<InterviewerPojo>  cc = new ArrayList<InterviewerPojo>();
		InterviewerPojo bean;
		try {
			pst = con.prepareStatement("select name,level from interviewer order by level");
			System.out.println(pst);																																																															
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NullPointerException e){
				return null;
			}
		 while(rs.next()) {
			 String name = rs.getString("name");
			 int level = rs.getInt("level");	
			 bean = new InterviewerPojo(name,level,"","");
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
	
	public int setFeedback(String i_id, String feed, String res) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			
			pst1 =  con.prepareStatement("select interviewer,candidate from scheduler where interview_id=" +i_id);
			rs1 = pst1.executeQuery();
			rs1.next();
			String intr = rs1.getString("interviewer");
			String can = rs1.getString("candidate");
			System.out.println(pst1);
			pst1 = con.prepareStatement("select level,mobile from candidate where name = '"+can+"'");
			rs1 = pst1.executeQuery();
			rs1.next();
			int level = Integer.parseInt(rs1.getString("level"));
			String mobile = rs1.getString("mobile");
			System.out.println(pst1);
			pst1 = con.prepareStatement("select email from interviewer where Name= '"+intr+"'");
			rs1 = pst1.executeQuery();
			rs1.next();
			System.out.println(pst1);
			String email = rs1.getString("email");
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
