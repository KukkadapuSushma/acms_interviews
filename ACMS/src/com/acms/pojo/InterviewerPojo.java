package com.acms.pojo;

public class InterviewerPojo {
	private String Name;
	private int Level;
	private String Phone;
	private String Email;

	public InterviewerPojo() {

	}

	public InterviewerPojo(String Name,int Level,String Phone,String Email){
		super();
		this.Name = Name;
		this.Level = Level;
		this.Phone = Phone;
		this.Email = Email;
	}
	public String getName() {
		return Name;
	}
	public int getLevel() {
		return Level;
	}
	public String getPhone() {
		return Phone;
	}
	public String getEmail() {
		return Email;
	}
}