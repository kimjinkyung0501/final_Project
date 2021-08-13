package com.project.jk.store.product;

public class Product {

 private int p_rn; 
 private int p_no;
 private int p_stock;
 private String	p_name;
 private int p_price;
 private String	p_content;
 private String	p_label;
 private String	p_option;
 private String	p_photo1;
 private String	p_photo2;
 private String	p_photo3;
 
 public Product() {
	// TODO Auto-generated constructor stub
}

public Product(int p_rn, int p_no, int p_stock, String p_name, int p_price, String p_content, String p_label,
		String p_option, String p_photo1, String p_photo2, String p_photo3) {
	super();
	this.p_rn = p_rn;
	this.p_no = p_no;
	this.p_stock = p_stock;
	this.p_name = p_name;
	this.p_price = p_price;
	this.p_content = p_content;
	this.p_label = p_label;
	this.p_option = p_option;
	this.p_photo1 = p_photo1;
	this.p_photo2 = p_photo2;
	this.p_photo3 = p_photo3;
}

public int getP_rn() {
	return p_rn;
}

public void setP_rn(int p_rn) {
	this.p_rn = p_rn;
}

public int getP_no() {
	return p_no;
}

public void setP_no(int p_no) {
	this.p_no = p_no;
}

public int getP_stock() {
	return p_stock;
}

public void setP_stock(int p_stock) {
	this.p_stock = p_stock;
}

public String getP_name() {
	return p_name;
}

public void setP_name(String p_name) {
	this.p_name = p_name;
}

public int getP_price() {
	return p_price;
}

public void setP_price(int p_price) {
	this.p_price = p_price;
}

public String getP_content() {
	return p_content;
}

public void setP_content(String p_content) {
	this.p_content = p_content;
}

public String getP_label() {
	return p_label;
}

public void setP_label(String p_label) {
	this.p_label = p_label;
}

public String getP_option() {
	return p_option;
}

public void setP_option(String p_option) {
	this.p_option = p_option;
}

public String getP_photo1() {
	return p_photo1;
}

public void setP_photo1(String p_photo1) {
	this.p_photo1 = p_photo1;
}

public String getP_photo2() {
	return p_photo2;
}

public void setP_photo2(String p_photo2) {
	this.p_photo2 = p_photo2;
}

public String getP_photo3() {
	return p_photo3;
}

public void setP_photo3(String p_photo3) {
	this.p_photo3 = p_photo3;
}


}
