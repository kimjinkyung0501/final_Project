package com.project.jk.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductMapper;

@Service
public class OrderDAO {

	@Autowired
	private SqlSession ss;
	private ArrayList<p_order2> p_order2s;
	
	public void RegP_Order(p_order2 po2, HttpServletRequest request ) {
	
		 String zipNo = request.getParameter("zipNo");
		 String addrDetail = request.getParameter("addrDetail");
		 String roadFullAddr = request.getParameter("roadFullAddr");
		
	
 
		
		 po2.setP2_addr(zipNo+","+addrDetail+","+roadFullAddr);
		
		 Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(HH시 mm분)");
			String p2_date = sdf.format(today);
			po2.setP2_date(p2_date);
		 
		ss.getMapper(OrderMapper.class).pOrderReg(po2);
		
	}
	public void minusStrock(p_order2 po2, HttpServletRequest request) {
		ss.getMapper(OrderMapper.class).minusStock(po2);
		
	}
	public void RegL_Order(L_order lo, HttpServletRequest request ) {
		


		ss.getMapper(OrderMapper.class).lOrderReg(lo);
		
		
	}

	
	
	
	public void charge(p_order2 po2, HttpServletRequest request){
	 String charge=	 request.getParameter("charge");
	 
	 if (charge.equals("카카오페이")) {
		 request.setAttribute("addr",po2.getP2_addr());
		 request.setAttribute("email",po2.getP2_email());
		 request.setAttribute("phone",po2.getP2_phone());
		 request.setAttribute("p_name",po2.getP2_p_name());
		 request.setAttribute("name",po2.getP2_name());
		 request.setAttribute("totalPrice",po2.getP2_sumPrice());
		 request.setAttribute("contentPage", "order/kakaoPay.jsp");
	}else {
		request.setAttribute("r", "결제성공");
		request.setAttribute("contentPage", "order/orderResult.jsp"); 
	}
		
	}
	public void charge2(L_order lo, HttpServletRequest request){
		String charge=	 request.getParameter("charge");
		
		if (charge.equals("카카오페이")) {
			
			System.out.println(request.getParameter("phone"));
			System.out.println(request.getParameter("m_name"));
			System.out.println(request.getParameter("l_name"));
			System.out.println(request.getParameter("phone"));
			System.out.println(request.getParameter("price"));
			
			request.setAttribute("email",lo.getO_email());
			request.setAttribute("phone",request.getParameter("phone"));
			request.setAttribute("p_name",request.getParameter("l_name"));
			request.setAttribute("name",request.getParameter("m_name"));
			request.setAttribute("totalPrice",request.getParameter("price"));
			request.setAttribute("p_no",request.getParameter("p_no"));
			 request.setAttribute("addr","생활수집");

			request.setAttribute("contentPage", "order/kakaoPay2.jsp");
		}else {
			request.setAttribute("r", "결제성공");
			request.setAttribute("contentPage", "order/orderResult.jsp"); 
		}
		
		
	}
	public void returnStock(p_order2 po2) {
		ss.getMapper(OrderMapper.class).returnStock(po2);
	}
	
	public void deletePorder(p_order2 po2) {
		ss.getMapper(OrderMapper.class).deletePorder(po2);
	}
	public void PordercConfrim(Product p,HttpServletRequest request) {
		p_order2s= ss.getMapper(OrderMapper.class).PordercConfrim(p);
		request.setAttribute("p_order2s", p_order2s);
	}
	
	public void paging(int page, HttpServletRequest request) {
		request.setAttribute("curPageNO", page);

		int cnt = 12; // 
		int total = p_order2s.size(); 
		if (total != 0) {
		int pageCount = (int) Math.ceil(total / (double) cnt);

		request.setAttribute("pageCount", pageCount);

		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<p_order2> items = new ArrayList<p_order2>();
		for (int i = start - 1; i > end; i--) {
			items.add(p_order2s.get(i));
		}

		request.setAttribute("p_order2s", items);
		
	}
	
	
	}
	public void rankProduct( HttpServletRequest request) {
		ArrayList<p_order2> p_o2 = ss.getMapper(OrderMapper.class).rankProduct();
		for (p_order2 b : p_o2) {
			System.out.println(b.getP2_no());
		}
		request.setAttribute("Rank", p_o2);
	}
	public void rankLesson(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	public void charge3(HttpServletRequest request){
		
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		
		request.setAttribute("email","dfdsfsf@fsfs");
		request.setAttribute("phone","010222222");
		request.setAttribute("p_name","여러개");
		request.setAttribute("name",name);
		request.setAttribute("totalPrice",price);
		request.setAttribute("p_no","여러개");
		 request.setAttribute("addr","생활수집");

	}
	
}
