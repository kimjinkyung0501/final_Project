package com.project.jk.common;

public class LessonBean {
	  private String l_video;
	   private String l_photo;
	   private String l_label;
	   private String l_content;
	   private String l_name;
	   private int l_price;
	   private int l_no;
	   private String o_id;
	   
	   public LessonBean() {
		// TODO Auto-generated constructor stub
	}

	public LessonBean(String l_video, String l_photo, String l_label, String l_content, String l_name, int l_price,
			int l_no, String o_id) {
		super();
		this.l_video = l_video;
		this.l_photo = l_photo;
		this.l_label = l_label;
		this.l_content = l_content;
		this.l_name = l_name;
		this.l_price = l_price;
		this.l_no = l_no;
		this.o_id = o_id;
	}

	public String getL_video() {
		return l_video;
	}

	public void setL_video(String l_video) {
		this.l_video = l_video;
	}

	public String getL_photo() {
		return l_photo;
	}

	public void setL_photo(String l_photo) {
		this.l_photo = l_photo;
	}

	public String getL_label() {
		return l_label;
	}

	public void setL_label(String l_label) {
		this.l_label = l_label;
	}

	public String getL_content() {
		return l_content;
	}

	public void setL_content(String l_content) {
		this.l_content = l_content;
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

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	   
}
