package com.project.jk.message;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MessageHC {

   @Autowired
   private MessageDAO messageDAO;   
   
   @RequestMapping(value = "message.go", method = RequestMethod.GET)
   public String home(HttpServletRequest request,Message m) {
      
      messageDAO.showMessage(request, m);
      
      return "message/messageHome";
   }
   
   
    // Ajex 사용시 이게 없으면 값을 보내기만 하고 받을 수가 없다.!!!@@
   @RequestMapping(value = "message.text", method = RequestMethod.GET)
   public @ResponseBody List<Message> getText(HttpServletRequest request, Message m) {
      
      
      messageDAO.tOZero(m);// 읽음 표시를 영으로

      //DAO에서 받은 (text)를 받아서 보낼 수 있는 형태로 
      List<Message> text = messageDAO.getText(request, m);
      
      messageDAO.getLastIndex(m, request);

   
         
         
      for (Message mss : text) {
         System.out.println( "센더:"+mss.getMsg_sender()+"/리시버 : "+mss.getMsg_reciver()+"/글: "+mss.getMsg_text());
      }
      
      
      return text;
   }
   //메시지 기록이 있는 사람에게 보내기 
   @ResponseBody 
   @RequestMapping(value = "message.send", method = RequestMethod.GET)
   public List<Message> sendText(HttpServletRequest request, Message m) {
      
   
      System.out.println("dddddddddd"+m.getMsg_sender());
      messageDAO.getLastIndex(m, request);
        messageDAO.sendText(request, m);   
       List<Message> text = messageDAO.getLastText(request, m); //
       
      
      return text;
   }
   //새로운 사용자에게 메시지 보내기 
   @ResponseBody 
   @RequestMapping(value = "message.sendToStranger", method = RequestMethod.GET)
   public void sendToStranger(HttpServletRequest request, Message m) {
      
     messageDAO.sendToStranger(request, m);      
      
   }
   
   @ResponseBody // 새로운 메시지를 보낸 때 그 사람의 아이디가 있는지 확인 하는 기능
   @RequestMapping(value = "message.reciverCheck", method = RequestMethod.GET)
   public int cheackReciver(HttpServletRequest request, Message m) {
      
   int check =   messageDAO.reciverCheck(request);
      return check;
   }
   
   //불편사항을 신고하는 페이지로 이동
   @RequestMapping(value = "admin.complainReport.go", method = RequestMethod.GET)
   public String GoToReport(HttpServletRequest request,Message m) {
      
      
      return "message/reportComplain";
   }

   //불편사항을 접수하는 기능
   @RequestMapping(value = "admin.reportMessageSend", method = RequestMethod.GET)
   public String SendReport(HttpServletRequest request,Complain c) {
      
      
       messageDAO.SendReport(request, c);
      
      return "message/reportResult";
   }
   
   
   @ResponseBody // 새로운 메시지를 보낸 때 그 사람의 아이디가 있는지 확인 하는 기능
   @RequestMapping(value = "message.newMessageCheck", method = RequestMethod.GET)
   public int newMessageCheck(HttpServletRequest request, Message m) {
      
   int howMany =   messageDAO.newMessageCheck(request);
      return howMany;
   }
}