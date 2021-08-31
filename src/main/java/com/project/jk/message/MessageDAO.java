package com.project.jk.message;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageDAO {

	@Autowired
	private SqlSession ss;

	public void showMessage(HttpServletRequest request, Message m) {

	      String MyS = request.getParameter("msg_sender");
	      String MyR = request.getParameter("msg_reciver");
	      System.out.println(MyS);
	      System.out.println(MyR);
	      
	      List<Message> messages = ss.getMapper(MessgeMapper.class).showAll(m);
	      ArrayList<Users> names = new ArrayList<Users>();
	      System.out.println(messages.get(0).getTest() + "-------");
	      
	      
	      
	            
	      for (int i = 0; i < messages.size(); i++) {
	         Users u = new Users();
	         
	         u.setSender(messages.get(i).getTest());// 보낸 사람 이름

	         u.setReciver(MyR); // 받는 사람 이름

	         int t = ss.getMapper(MessgeMapper.class).countNo(u); // 보낸것의 갯수
	         u.setDidntRead(t);
	         
	         names.add(u);
	      }
	   request.setAttribute("messaegs", names);
	         
	      }
	      

	public List<Message> getText(HttpServletRequest request, Message m) {

	      System.out.println("DAO------------------");
	      System.out.println(m.getMsg_reciver());
	      System.out.println(m.getMsg_sender());

	      
	      String hour;
	      String min;
	      
	      
	      List<Message> text = ss.getMapper(MessgeMapper.class).getText(m);
	      System.out.println(1);
	      Date d = new Date();
	      for (Message msg : text) {
	         
	      hour =   msg.getMsg_date().getHours() + "";
	      min = msg.getMsg_date().getMinutes() + "";

	      
	      int hourCheck=Integer.parseInt(hour);

	            if (hourCheck>11) {
	               
	               msg.setHour("오후 " + (hourCheck - 12));
	            }else {
	               msg.setHour("오전 " + hour);
	               
	            }
	      
	      msg.setMin(min);
	         
	      }
	      
	      System.out.println(2);
	      request.setAttribute("text", text);
	      return text;

	   

	   }

	public void sendText(HttpServletRequest request, Message m) {

//		ss.getMapper(MessgeMapper.class).sendText(m);// 메시지 insert
		
		
		if (ss.getMapper(MessgeMapper.class).sendText(m) == 1) {
		System.out.println("메시전송 성공@@@@");
		} else {
			System.out.println("메시전송 실패@@@@");

		}

	}
	
	public void getLastIndex(Message m, HttpServletRequest req) {
		int number = ss.getMapper(MessgeMapper.class).getNumber(m);
		System.out.println(number + "!@!@@!!!@@!@!@!@@!@");
		req.getSession().setAttribute("num123", number);
	}

	public List<Message> getLastText(HttpServletRequest request, Message m) {
		
		
		
		System.out.println("lastText------------------");
		System.out.println(m.getMsg_reciver());
		System.out.println(m.getMsg_sender());
		System.out.println("lastText------------------");

		
		
		
		List<Message> text = ss.getMapper(MessgeMapper.class).getLastText(m);
		request.setAttribute("text", text);
		
		
		
		return text;
	}

	public int reciverCheck(HttpServletRequest request) {

		String s= request.getParameter("newReciver");
		
	int check =	ss.getMapper(MessgeMapper.class).checkReciver(s);
		System.out.println(check);
		
		
		return check;
		
		
	}

	public void sendToStranger(HttpServletRequest request, Message m) {
		System.out.println("메시지 보내기!!!!!!!!!!!!!!!!!!");
	
		
	ss.getMapper(MessgeMapper.class).sendText(m);
	
		
        
	}
// 불편사항을 접수
	public void SendReport(HttpServletRequest request, Complain c) {
		
	/*String assorter=	request.getParameter("assorter");
	String content =	request.getParameter("content");
	String id =	request.getParameter("c_id");
	
	System.out.println("assorter"+assorter);
	System.out.println("content"+content);
	System.out.println("id"+id);
	
        HashMap<String, String> reportContentMap = new HashMap<String, String>(); 
	
        reportContentMap.put("assorter", assorter);
        reportContentMap.put("content", content);
        reportContentMap.put("id", id);
      */
      if(ss.getMapper(MessgeMapper.class).report(c)==1) {
    	  
    	  request.setAttribute("result_C", "접수 되었습니다! 회원정보에 기재된 연락처로 연락 드리겠습니다!");
    	  
      }else {
		
    	  request.setAttribute("result_C", "접수에 실패했습니다!계속 전송에 실패하신다면 관리자에게 연락부탁드립니다!");
	}
      
		
	}
	

	
	// 읽음을 영으로 
	   public void tOZero(Message m) {

	      System.out.println("전부 읽음으로 표시하기 -----start");
	        System.out.println(m.getMsg_reciver() + "받은사람");
	        System.out.println(m.getMsg_sender() + "보낸 사람");
	        System.out.println("전부 읽음으로 표시하기 -----end");
	      
	      ss.getMapper(MessgeMapper.class).toZero(m);
	      
	      
	   }
	
	   
	// 새로운 메시지가 몇개가 있는지 
	   public int newMessageCheck(HttpServletRequest request) {
	      
	      String id= request.getParameter("id");
	      
	      
	      int howMany = ss.getMapper(MessgeMapper.class).howManyNew(id);
	      
	      return howMany;
	   }
	   
}
