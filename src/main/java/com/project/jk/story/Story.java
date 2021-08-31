package com.project.jk.story;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Story {
   
   private BigDecimal s_no;
   private String s_id;
   private String s_title;
   private Date s_date;
   private String s_content;
   private String s_photo;
   private BigDecimal s_like_count;
   
   private List<StoryReply> reply;
   
   public List<StoryReply> getReply() {
      return reply;
   }
   
   public Story() {
      // TODO Auto-generated constructor stub
   }

   public Story(BigDecimal s_no, String s_id, String s_title, Date s_date, String s_content, String s_photo,
         BigDecimal s_like_count, List<StoryReply> reply) {
      super();
      this.s_no = s_no;
      this.s_id = s_id;
      this.s_title = s_title;
      this.s_date = s_date;
      this.s_content = s_content;
      this.s_photo = s_photo;
      this.s_like_count = s_like_count;
      this.reply = reply;
   }

   public BigDecimal getS_no() {
      return s_no;
   }

   public void setS_no(BigDecimal s_no) {
      this.s_no = s_no;
   }

   public String getS_id() {
      return s_id;
   }

   public void setS_id(String s_id) {
      this.s_id = s_id;
   }

   public String getS_title() {
      return s_title;
   }

   public void setS_title(String s_title) {
      this.s_title = s_title;
   }

   public Date getS_date() {
      return s_date;
   }

   public void setS_date(Date s_date) {
      this.s_date = s_date;
   }

   public String getS_content() {
      return s_content;
   }

   public void setS_content(String s_content) {
      this.s_content = s_content;
   }

   public String getS_photo() {
      return s_photo;
   }

   public void setS_photo(String s_photo) {
      this.s_photo = s_photo;
   }

   public BigDecimal getS_like_count() {
      return s_like_count;
   }

   public void setS_like_count(BigDecimal s_like_count) {
      this.s_like_count = s_like_count;
   }

   public void setReply(List<StoryReply> reply) {
      this.reply = reply;
   }
   
   
   
   
   
   
   
   

}