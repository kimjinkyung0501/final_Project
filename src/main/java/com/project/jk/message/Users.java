package com.project.jk.message;

public class Users {
   String sender;
   String reciver;
   int didntRead;
   
   public Users() {
      // TODO Auto-generated constructor stub
   }

   public Users(String sender, String reciver, int didntRead) {
      super();
      this.sender = sender;
      this.reciver = reciver;
      this.didntRead = didntRead;
   }

   public String getSender() {
      return sender;
   }

   public void setSender(String sender) {
      this.sender = sender;
   }

   public String getReciver() {
      return reciver;
   }

   public void setReciver(String reciver) {
      this.reciver = reciver;
   }

   public int getDidntRead() {
      return didntRead;
   }

   public void setDidntRead(int didntRead) {
      this.didntRead = didntRead;
   }
   
   
   
}