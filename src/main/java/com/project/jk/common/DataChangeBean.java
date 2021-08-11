package com.project.jk.common;

public class DataChangeBean {
	private String newData;
	private String preData;
	private String memberId;
	
	public DataChangeBean() {
		// TODO Auto-generated constructor stub
	}

	public DataChangeBean(String newData, String preData, String memberId) {
		super();
		this.newData = newData;
		this.preData = preData;
		this.memberId = memberId;
	}

	public String getNewData() {
		return newData;
	}

	public void setNewData(String newData) {
		this.newData = newData;
	}

	public String getPreData() {
		return preData;
	}

	public void setPreData(String preData) {
		this.preData = preData;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	

	
}
