package com.project.jk.message;

public class Complain {

   private int c_no;
   private String c_id;
   private String c_reason;
   private String c_content;
   private String c_date;
   private String c_phone;
   private String c_email;
   private String c_state;
   public Complain() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Complain(int c_no, String c_id, String c_reason, String c_content, String c_date, String c_phone,
         String c_email, String c_state) {
      super();
      this.c_no = c_no;
      this.c_id = c_id;
      this.c_reason = c_reason;
      this.c_content = c_content;
      this.c_date = c_date;
      this.c_phone = c_phone;
      this.c_email = c_email;
      this.c_state = c_state;
   }
   public int getC_no() {
      return c_no;
   }
   public void setC_no(int c_no) {
      this.c_no = c_no;
   }
   public String getC_id() {
      return c_id;
   }
   public void setC_id(String c_id) {
      this.c_id = c_id;
   }
   public String getC_reason() {
      return c_reason;
   }
   public void setC_reason(String c_reason) {
      this.c_reason = c_reason;
   }
   public String getC_content() {
      return c_content;
   }
   public void setC_content(String c_content) {
      this.c_content = c_content;
   }
   public String getC_date() {
      return c_date;
   }
   public void setC_date(String c_date) {
      this.c_date = c_date;
   }
   public String getC_phone() {
      return c_phone;
   }
   public void setC_phone(String c_phone) {
      this.c_phone = c_phone;
   }
   public String getC_email() {
      return c_email;
   }
   public void setC_email(String c_email) {
      this.c_email = c_email;
   }
   public String getC_state() {
      return c_state;
   }
   public void setC_state(String c_state) {
      this.c_state = c_state;
   }
   
   

}