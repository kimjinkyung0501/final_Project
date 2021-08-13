package com.project.jk.store;

public class Store {

	private String s_id;
	private int s_no;
	private String s_name;
	private String s_exp;
	private String s_img;
	
	
	 public Store() {
		// TODO Auto-generated constructor stub
	}


	public Store(String s_id, int s_no, String s_name, String s_exp, String s_img) {
		super();
		this.s_id = s_id;
		this.s_no = s_no;
		this.s_name = s_name;
		this.s_exp = s_exp;
		this.s_img = s_img;
	}


	public String getS_id() {
		return s_id;
	}


	public void setS_id(String s_id) {
		this.s_id = s_id;
	}


	public int getS_no() {
		return s_no;
	}


	public void setS_no(int s_no) {
		this.s_no = s_no;
	}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public String getS_exp() {
		return s_exp;
	}


	public void setS_exp(String s_exp) {
		this.s_exp = s_exp;
	}


	public String getS_img() {
		return s_img;
	}


	public void setS_img(String s_img) {
		this.s_img = s_img;
	}


}
