package com.acms.pojo;

public class CandidatePojo {

	private String Name;
	private String Gender;
	private String Quali;
	private String Email;
	private String Phone;
	public int level;

	public CandidatePojo() {

	}

	public CandidatePojo(String Name,String Gender,String Quali,String Email,String Phone, int level){
		super();
		//this.partner_id = partner_id;
		this.Name = Name;
		this.Gender = Gender;
		this.Quali = Quali;
		this.Phone = Phone;
		this.Email = Email;
		this.level = level;
	}
	
	public String getName() {
		return Name;
	}
	public String getGender() {
		return Gender;
	}
	public String getQuali() {
		return Quali;
	}
	public String getPhone() {
		return Phone;
	}
	public String getEmail() {
		return Email;
	}
	public int getLevel() {
		return level;
	}
}