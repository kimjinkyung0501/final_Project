package com.project.jk.comment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.product.Product;

@Service
public class L_CommentDAO {

	@Autowired
	private SqlSession ss;
	
	private ArrayList<L_Comment> l_comments;
	
	
	
	public void regComment(L_Comment lc, HttpServletRequest request) {
		System.out.println(request.getParameter("l_no"));
		System.out.println(request.getParameter("l_c_no"));
		System.out.println(request.getParameter("l_c_comment"));
		System.out.println(request.getParameter("l_c_id"));
		
		
		if (ss.getMapper(CommentMapper.class).l_commentReg(lc)==1) {
			request.setAttribute("r","성공" );
		}else {
		request.setAttribute("r","실패" );
		}
		
	}
	
	public void getAlllComment(Lesson l,HttpServletRequest request) {
		
		l_comments = ss.getMapper(CommentMapper.class).getAllL_comment(l);
		request.setAttribute("l_comments", l_comments);
		
	}
	
	public void paging(int page, HttpServletRequest request) {
		request.setAttribute("curPageNO", page);

		int cnt = 5; // 
		int total = l_comments.size(); 
		if (total != 0) {
		int pageCount = (int) Math.ceil(total / (double) cnt);

		request.setAttribute("pageCount", pageCount);

		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<L_Comment> items = new ArrayList<L_Comment>();
		for (int i = start - 1; i > end; i--) {
			items.add(l_comments.get(i));
		}

		request.setAttribute("l_comments", items);
		
	}
	
	
	}

	public void delete(L_Comment lc) {
		ss.getMapper(CommentMapper.class).l_commentdelete(lc);
			
		
		
	}

	public void update(L_Comment lc) {
		ss.getMapper(CommentMapper.class).l_commentUpdate(lc);
		
	}
	
	
}
