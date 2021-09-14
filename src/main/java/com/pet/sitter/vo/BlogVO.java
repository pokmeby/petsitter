package com.pet.sitter.vo;

import java.util.Date;


public class BlogVO {
	private int blog_bno;
	private String blog_title;
	private String	blog_content;
	private String blog_email;
	private String blog_image;
	private Date blog_date;
	public int getBlog_bno() {
		return blog_bno;
	}
	public void setBlog_bno(int blog_bno) {
		this.blog_bno = blog_bno;
	}
	public String getBlog_title() {
		return blog_title;
	}
	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}
	public String getBlog_content() {
		return blog_content;
	}
	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}

	public String getBlog_email() {
		return blog_email;
	}
	public void setBlog_email(String blog_email) {
		this.blog_email = blog_email;
	}
	public String getBlog_image() {
		return blog_image;
	}
	public void setBlog_image(String blog_image) {
		this.blog_image = blog_image;
	}
	public Date getBlog_date() {
		return blog_date;
	}
	public void setBlog_date(Date blog_date) {
		this.blog_date = blog_date;
	}

	
}
