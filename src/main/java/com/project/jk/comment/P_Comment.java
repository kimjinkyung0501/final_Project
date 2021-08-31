package com.project.jk.comment;

import java.util.Date;

public class P_Comment {

	private String p_c_id;
	private int p_c_no;
	private String p_c_photo;
	private String p_c_content;
	private int p_mark;
	private Date p_date;
	private int p_c_pk;
	
	public P_Comment() {
		// TODO Auto-generated constructor stub
	}

	public P_Comment(String p_c_id, int p_c_no, String p_c_photo, String p_c_content, int p_mark, Date p_date,
			int p_c_pk) {
		super();
		this.p_c_id = p_c_id;
		this.p_c_no = p_c_no;
		this.p_c_photo = p_c_photo;
		this.p_c_content = p_c_content;
		this.p_mark = p_mark;
		this.p_date = p_date;
		this.p_c_pk = p_c_pk;
	}

	public String getP_c_id() {
		return p_c_id;
	}

	public void setP_c_id(String p_c_id) {
		this.p_c_id = p_c_id;
	}

	public int getP_c_no() {
		return p_c_no;
	}

	public void setP_c_no(int p_c_no) {
		this.p_c_no = p_c_no;
	}

	public String getP_c_photo() {
		return p_c_photo;
	}

	public void setP_c_photo(String p_c_photo) {
		this.p_c_photo = p_c_photo;
	}

	public String getP_c_content() {
		return p_c_content;
	}

	public void setP_c_content(String p_c_content) {
		this.p_c_content = p_c_content;
	}

	public int getP_mark() {
		return p_mark;
	}

	public void setP_mark(int p_mark) {
		this.p_mark = p_mark;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_c_pk() {
		return p_c_pk;
	}

	public void setP_c_pk(int p_c_pk) {
		this.p_c_pk = p_c_pk;
	}

	
	
	
}
