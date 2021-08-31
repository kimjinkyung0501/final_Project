package com.project.jk.order;

public class p_order {
	
	private int o_no;
	private String o_id;
	private String o_m_addr;
	private int o_quantidey;
	private String o_phone;
	private int o_o_nop;
	
	public p_order() {
		// TODO Auto-generated constructor stub
	}

	public p_order(int o_no, String o_id, String o_m_addr, int o_quantidey, String o_phone, int o_o_nop) {
		super();
		this.o_no = o_no;
		this.o_id = o_id;
		this.o_m_addr = o_m_addr;
		this.o_quantidey = o_quantidey;
		this.o_phone = o_phone;
		this.o_o_nop = o_o_nop;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_m_addr() {
		return o_m_addr;
	}

	public void setO_m_addr(String o_m_addr) {
		this.o_m_addr = o_m_addr;
	}

	public int getO_quantidey() {
		return o_quantidey;
	}

	public void setO_quantidey(int o_quantidey) {
		this.o_quantidey = o_quantidey;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	public int getO_o_nop() {
		return o_o_nop;
	}

	public void setO_o_nop(int o_o_nop) {
		this.o_o_nop = o_o_nop;
	}
	
	

}
