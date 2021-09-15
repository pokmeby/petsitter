package com.pet.sitter.vo;

import java.util.Date;

public class ReviewReplyVO {

	private String user_email;
	private Date re_write_date;
	private int re_star;
	private String re_content;
	private int re_num;
	private int rno;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getRe_write_date() {
		return re_write_date;
	}
	public void setRe_write_date(Date re_write_date) {
		this.re_write_date = re_write_date;
	}
	public int getRe_star() {
		return re_star;
	}
	public void setRe_star(int re_star) {
		this.re_star = re_star;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
}
