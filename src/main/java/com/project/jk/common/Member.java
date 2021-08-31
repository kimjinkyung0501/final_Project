package com.project.jk.common;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_addr;
	private String m_phone;
	private String m_email;
	private int m_grade;
	private String m_photo;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_pw, String m_name, String m_addr, String m_phone, String m_email, int m_grade,
			String m_photo) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_addr = m_addr;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_grade = m_grade;
		this.m_photo = m_photo;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}


	
}
