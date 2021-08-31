package com.project.jk.message;

import java.util.Date;

public class Message {

private int   msg_no; 
private int   msg_noAll; 
private String min;
private String   msg_sender ;
private String   msg_reciver ;
private String   msg_text ;
private Date   msg_date ;
private String   msg_readed;
private String   msg_photo;
private String test;
private String hour;

public String getHour() {
   return hour;
}
public void setHour(String hour) {
   this.hour = hour;
}
public String getMin() {
   return min;
}
public void setMin(String min) {
   this.min = min;
}
public Message() {
   super();
   // TODO Auto-generated constructor stub
}
public Message(int msg_no, int msg_noAll, String msg_sender, String msg_reciver, String msg_text, Date msg_date,
      String msg_readed, String msg_photo, String test) {
   super();
   this.msg_no = msg_no;
   this.msg_noAll = msg_noAll;
   this.msg_sender = msg_sender;
   this.msg_reciver = msg_reciver;
   this.msg_text = msg_text;
   this.msg_date = msg_date;
   this.msg_readed = msg_readed;
   this.msg_photo = msg_photo;
   this.test = test;
}
public int getMsg_no() {
   return msg_no;
}
public void setMsg_no(int msg_no) {
   this.msg_no = msg_no;
}
public int getMsg_noAll() {
   return msg_noAll;
}
public void setMsg_noAll(int msg_noAll) {
   this.msg_noAll = msg_noAll;
}
public String getMsg_sender() {
   return msg_sender;
}
public void setMsg_sender(String msg_sender) {
   this.msg_sender = msg_sender;
}
public String getMsg_reciver() {
   return msg_reciver;
}
public void setMsg_reciver(String msg_reciver) {
   this.msg_reciver = msg_reciver;
}
public String getMsg_text() {
   return msg_text;
}
public void setMsg_text(String msg_text) {
   this.msg_text = msg_text;
}
public Date getMsg_date() {
   return msg_date;
}
public void setMsg_date(Date msg_date) {
   this.msg_date = msg_date;
}
public String getMsg_readed() {
   return msg_readed;
}
public void setMsg_readed(String msg_readed) {
   this.msg_readed = msg_readed;
}
public String getMsg_photo() {
   return msg_photo;
}
public void setMsg_photo(String msg_photo) {
   this.msg_photo = msg_photo;
}
public String getTest() {
   return test;
}
public void setTest(String test) {
   this.test = test;
}


}