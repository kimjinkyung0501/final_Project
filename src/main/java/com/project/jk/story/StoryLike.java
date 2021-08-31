package com.project.jk.story;


public class StoryLike {
   private int like_pk;
   private int ls_no;
   private String lm_id;
   
   public StoryLike() {
      // TODO Auto-generated constructor stub
   }

   public StoryLike(int like_pk, int ls_no, String lm_id) {
      super();
      this.like_pk = like_pk;
      this.ls_no = ls_no;
      this.lm_id = lm_id;
   }

   public int getLike_pk() {
      return like_pk;
   }

   public void setLike_pk(int like_pk) {
      this.like_pk = like_pk;
   }

   public int getLs_no() {
      return ls_no;
   }

   public void setLs_no(int ls_no) {
      this.ls_no = ls_no;
   }

   public String getLm_id() {
      return lm_id;
   }

   public void setLm_id(String lm_id) {
      this.lm_id = lm_id;
   }
   
   
   
   
   
   
   
   
}