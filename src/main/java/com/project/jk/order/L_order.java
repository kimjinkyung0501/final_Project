package com.project.jk.order;

public class L_order {

  private int o_no; 
  private String o_id;
  private String o_email;
  private int o_o_noc;
	
  
  public L_order() {
	// TODO Auto-generated constructor stub
}


public L_order(int o_no, String o_id, String o_email, int o_o_noc) {
	super();
	this.o_no = o_no;
	this.o_id = o_id;
	this.o_email = o_email;
	this.o_o_noc = o_o_noc;
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


public String getO_email() {
	return o_email;
}


public void setO_email(String o_email) {
	this.o_email = o_email;
}


public int getO_o_noc() {
	return o_o_noc;
}


public void setO_o_noc(int o_o_noc) {
	this.o_o_noc = o_o_noc;
}
  
  
}
