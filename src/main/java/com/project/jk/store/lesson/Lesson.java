package com.project.jk.store.lesson;

public class Lesson {

	private int l_rn;
	private int l_no;
	private String l_name;
	private int l_price;
	private String l_content;
	private String l_label;
	private String l_photo;
	private String l_video;
	
	
	public Lesson() {
		// TODO Auto-generated constructor stub
	}


	public Lesson(int l_rn, int l_no, String l_name, int l_price, String l_content, String l_label, String l_photo,
			String l_video) {
		super();
		this.l_rn = l_rn;
		this.l_no = l_no;
		this.l_name = l_name;
		this.l_price = l_price;
		this.l_content = l_content;
		this.l_label = l_label;
		this.l_photo = l_photo;
		this.l_video = l_video;
	}


	public int getL_rn() {
		return l_rn;
	}


	public void setL_rn(int l_rn) {
		this.l_rn = l_rn;
	}


	public int getL_no() {
		return l_no;
	}


	public void setL_no(int l_no) {
		this.l_no = l_no;
	}


	public String getL_name() {
		return l_name;
	}


	public void setL_name(String l_name) {
		this.l_name = l_name;
	}


	public int getL_price() {
		return l_price;
	}


	public void setL_price(int l_price) {
		this.l_price = l_price;
	}


	public String getL_content() {
		return l_content;
	}


	public void setL_content(String l_content) {
		this.l_content = l_content;
	}


	public String getL_label() {
		return l_label;
	}


	public void setL_label(String l_label) {
		this.l_label = l_label;
	}


	public String getL_photo() {
		return l_photo;
	}


	public void setL_photo(String l_photo) {
		this.l_photo = l_photo;
	}


	public String getL_video() {
		return l_video;
	}


	public void setL_video(String l_video) {
		this.l_video = l_video;
	}


	
	
}
