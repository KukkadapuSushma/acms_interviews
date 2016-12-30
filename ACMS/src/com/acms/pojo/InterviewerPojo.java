package com.acms.pojo;

public class InterviewerPojo {
	private long partner_id;
	private String Name;
	private String Website;
	private String City;
	private String Description;
	private String Address;

	public InterviewerPojo() {

	}

	public InterviewerPojo(long partner_id,String Name,String Website,String City,String Address){
		super();
		this.partner_id = partner_id;
		this.Name = Name;
		this.Website = Website;
		this.City = City;
		this.Address = Address;
		this.Description = Description;
	}
	/*public PartnerPojo(int partner_id){
		super();
		this.partner_id = partner_id;
	}*/
	public long getPartner_id() {
		return partner_id;
	}
	public String getName() {
		return Name;
	}
	public String getWebsite() {
		return Website;
	}
	public String getCity() {
		return City;
	}
	public String getAddress() {
		return Address;
	}
}