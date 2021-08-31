package com.project.jk.story;

import java.math.BigDecimal;
import java.util.Date;

public class StoryReply {
	private BigDecimal sr_pk;
	private String sr_id;
	private BigDecimal sr_no;
	private String sr_content;
	private Date sr_date;
	
	public StoryReply() {
		// TODO Auto-generated constructor stub
	}

	public StoryReply(BigDecimal sr_pk, String sr_id, BigDecimal sr_no, String sr_content, Date sr_date) {
		super();
		this.sr_pk = sr_pk;
		this.sr_id = sr_id;
		this.sr_no = sr_no;
		this.sr_content = sr_content;
		this.sr_date = sr_date;
	}

	public BigDecimal getSr_pk() {
		return sr_pk;
	}

	public void setSr_pk(BigDecimal sr_pk) {
		this.sr_pk = sr_pk;
	}

	public String getSr_id() {
		return sr_id;
	}

	public void setSr_id(String sr_id) {
		this.sr_id = sr_id;
	}

	public BigDecimal getSr_no() {
		return sr_no;
	}

	public void setSr_no(BigDecimal sr_no) {
		this.sr_no = sr_no;
	}

	public String getSr_content() {
		return sr_content;
	}

	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}

	public Date getSr_date() {
		return sr_date;
	}

	public void setSr_date(Date sr_date) {
		this.sr_date = sr_date;
	}
	
	
	
	

}
