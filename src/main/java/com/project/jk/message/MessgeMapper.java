package com.project.jk.message;

import java.util.HashMap;
import java.util.List;

public interface MessgeMapper {

   // 대화 상대 가져오기
   public List<Message> showAll(Message m);

   // 대화 상대와 대화내용 가져오기
   public List<Message> getText(Message m);

   // 메시지 보내기
   public int sendText(Message m);
// 보낼 메시지의 넘버 가져오기
   public int getNumber(Message m);

//대와상태와의 마지막 메시지 가져오기
   public List<Message> getLastText(Message m);

   
   public int checkReciver(String s);

   public int report(Complain c);

   public int countNo(Users u ); // 읽지 않은 메시지가 몇게인지 파악하기

   public void toZero(Message m);// 읽음표시를 영으로

   
   public int howManyNew(String id);// 몇개의 새로운 메시지가 있는지

   
}