package com.pet.sitter.vo;

public class PetInfoVO {
	
	private String pet_type;
	
	private int pet_age;
	
	private String pet_gender;
	
	private String pet_detail;
	
	private String pet_name;
	
	private String pet_image;
	
	private String user_email;

	
	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public int getPet_age() {
		return pet_age;
	}

	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public String getPet_gender() {
		return pet_gender;
	}

	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}

	public String getPet_detail() {
		return pet_detail;
	}

	public void setPet_detail(String pet_detail) {
		this.pet_detail = pet_detail;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_image() {
		return pet_image;
	}

	public void setPet_image(String pet_image) {
		this.pet_image = pet_image;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "PetInfoVO [pet_type=" + pet_type + ", pet_age=" + pet_age + ", pet_gender=" + pet_gender
				+ ", pet_detail=" + pet_detail + ", pet_name=" + pet_name + ", pet_image=" + pet_image + ", user_email="
				+ user_email + ", getPet_type()=" + getPet_type() + ", getPet_age()=" + getPet_age()
				+ ", getPet_gender()=" + getPet_gender() + ", getPet_detail()=" + getPet_detail() + ", getPet_name()="
				+ getPet_name() + ", getPet_image()=" + getPet_image() + ", getUser_email()=" + getUser_email()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	

}
