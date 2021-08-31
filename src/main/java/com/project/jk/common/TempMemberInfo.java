package com.project.jk.common;

public class TempMemberInfo {
	private String t_m_id;
	private String t_m_email;
	private String t_m_key;
	
	public TempMemberInfo() {
		// TODO Auto-generated constructor stub
	}

	public TempMemberInfo(String t_m_id, String t_m_email) {
		super();
		this.t_m_id = t_m_id;
		this.t_m_email = t_m_email;
	}

	public TempMemberInfo(String t_m_id, String t_m_email, String t_m_key) {
		super();
		this.t_m_id = t_m_id;
		this.t_m_email = t_m_email;
		this.t_m_key = t_m_key;
	}

	public String getT_m_id() {
		return t_m_id;
	}

	public void setT_m_id(String t_m_id) {
		this.t_m_id = t_m_id;
	}

	public String getT_m_email() {
		return t_m_email;
	}

	public void setT_m_email(String t_m_email) {
		this.t_m_email = t_m_email;
	}

	public String getT_m_key() {
		return t_m_key;
	}

	public void setT_m_key(String t_m_key) {
		this.t_m_key = t_m_key;
	}

	
	
}
