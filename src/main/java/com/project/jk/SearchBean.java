package com.project.jk;

public class SearchBean {

	private String c_label;
	private String c_name;
	private int c_price;
	private String c_photo;
	private int p_no;
	private int l_no;
	private int s_no;
	private String category;

	
	public SearchBean() {
		// TODO Auto-generated constructor stub
	}


	public String getC_label() {
		return c_label;
	}


	public void setC_label(String c_label) {
		this.c_label = c_label;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public int getC_price() {
		return c_price;
	}


	public void setC_price(int c_price) {
		this.c_price = c_price;
	}


	public String getC_photo() {
		return c_photo;
	}


	public void setC_photo(String c_photo) {
		this.c_photo = c_photo;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public int getL_no() {
		return l_no;
	}


	public void setL_no(int l_no) {
		this.l_no = l_no;
	}


	public int getS_no() {
		return s_no;
	}


	public void setS_no(int s_no) {
		this.s_no = s_no;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public SearchBean(String c_label, String c_name, int c_price, String c_photo, int p_no, int l_no, int s_no,
			String category) {
		super();
		this.c_label = c_label;
		this.c_name = c_name;
		this.c_price = c_price;
		this.c_photo = c_photo;
		this.p_no = p_no;
		this.l_no = l_no;
		this.s_no = s_no;
		this.category = category;
	}
	
	
	
}
