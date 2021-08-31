package com.project.jk.comment;

import java.util.Date;

public class L_Comment {

	
	private String l_c_id;
	private int l_c_no;
	private String l_c_photo;
	private String l_c_content;
	private int l_mark;
	private Date l_date;
	private int l_c_pk;
	
	
	public L_Comment() {
		// TODO Auto-generated constructor stub
	}


	public L_Comment(String l_c_id, int l_c_no, String l_c_photo, String l_c_content, int l_mark, Date l_date,
			int l_c_pk) {
		super();
		this.l_c_id = l_c_id;
		this.l_c_no = l_c_no;
		this.l_c_photo = l_c_photo;
		this.l_c_content = l_c_content;
		this.l_mark = l_mark;
		this.l_date = l_date;
		this.l_c_pk = l_c_pk;
	}


	public String getL_c_id() {
		return l_c_id;
	}


	public void setL_c_id(String l_c_id) {
		this.l_c_id = l_c_id;
	}


	public int getL_c_no() {
		return l_c_no;
	}


	public void setL_c_no(int l_c_no) {
		this.l_c_no = l_c_no;
	}


	public String getL_c_photo() {
		return l_c_photo;
	}


	public void setL_c_photo(String l_c_photo) {
		this.l_c_photo = l_c_photo;
	}


	public String getL_c_content() {
		return l_c_content;
	}


	public void setL_c_content(String l_c_content) {
		this.l_c_content = l_c_content;
	}


	public int getL_mark() {
		return l_mark;
	}


	public void setL_mark(int l_mark) {
		this.l_mark = l_mark;
	}


	public Date getL_date() {
		return l_date;
	}


	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}


	public int getL_c_pk() {
		return l_c_pk;
	}


	public void setL_c_pk(int l_c_pk) {
		this.l_c_pk = l_c_pk;
	}

	
	
}
