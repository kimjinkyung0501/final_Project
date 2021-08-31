package com.project.jk.notice;

import java.math.BigDecimal;
import java.util.Date;

public class Notice {
	
	private BigDecimal n_no;
	private String n_id;
	private String n_title;
	private Date n_date;
	private String n_content;
	private String n_photo;
	private BigDecimal n_count;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(BigDecimal n_no, String n_id, String n_title, Date n_date, String n_content, String n_photo,
			BigDecimal n_count) {
		super();
		this.n_no = n_no;
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_date = n_date;
		this.n_content = n_content;
		this.n_photo = n_photo;
		this.n_count = n_count;
	}

	public BigDecimal getN_no() {
		return n_no;
	}

	public void setN_no(BigDecimal n_no) {
		this.n_no = n_no;
	}

	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_photo() {
		return n_photo;
	}

	public void setN_photo(String n_photo) {
		this.n_photo = n_photo;
	}

	public BigDecimal getN_count() {
		return n_count;
	}

	public void setN_count(BigDecimal n_count) {
		this.n_count = n_count;
	}
	
	
	
	
	
}
