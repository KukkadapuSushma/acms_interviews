package com.acms.pojo;

public class InterviewerPojo {
	private String Name;
	private String Level;
	private String Phone;
	private String Email;

	public InterviewerPojo() {

	}

	public InterviewerPojo(String Name,String Level,String Phone,String Email){
		super();
		this.Name = Name;
		this.Level = Level;
		this.Phone = Phone;
		this.Email = Email;
	}
	public String getName() {
		return Name;
	}
	public String getLevel() {
		return Level;
	}
	public String getPhone() {
		return Phone;
	}
	public String getEmail() {
		return Email;
	}
}