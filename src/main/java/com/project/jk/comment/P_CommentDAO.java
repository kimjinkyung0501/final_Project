package com.project.jk.comment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jk.store.product.Product;

@Service
public class P_CommentDAO {
	
	@Autowired
	private SqlSession ss;
	
	private ArrayList<P_Comment> p_comments;
	
	
	
	public void regComment(P_Comment pc, HttpServletRequest request) {
		System.out.println(request.getParameter("p_no"));
		System.out.println(request.getParameter("p_c_no"));
		System.out.println(request.getParameter("p_c_comment"));
		System.out.println(request.getParameter("p_c_id"));
		

		
		if (ss.getMapper(CommentMapper.class).p_commentReg(pc)==1) {
			request.setAttribute("r","성공" );
		}else {
		request.setAttribute("r","실패" );
		}
		
	}
	
	public void getAllPComment(Product p,HttpServletRequest request) {
		
		p_comments = ss.getMapper(CommentMapper.class).getAllP_comment(p);
		request.setAttribute("p_comments", p_comments);
		
	}
	
	public void paging(int page, HttpServletRequest request) {
		request.setAttribute("curPageNO", page);

		int cnt = 5; // 
		int total = p_comments.size(); 
		if (total != 0) {
		int pageCount = (int) Math.ceil(total / (double) cnt);

		request.setAttribute("pageCount", pageCount);

		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<P_Comment> items = new ArrayList<P_Comment>();
		for (int i = start - 1; i > end; i--) {
			items.add(p_comments.get(i));
		}

		request.setAttribute("p_comments", items);
		
	}
	
	
	}

	public void delete(P_Comment pc) {
		ss.getMapper(CommentMapper.class).p_commentdelete(pc);
			
		
		
	}

	public void update(P_Comment pc) {
		ss.getMapper(CommentMapper.class).p_commentUpdate(pc);
		
	}
	
	
	
	
	
}
