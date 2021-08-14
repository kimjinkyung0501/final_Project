package com.project.jk.store.lesson;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductMapper;



@Service
public class LessonDAO {

	@Autowired
	private SqlSession ss;
	
	public void reglesson(Lesson l, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(path);
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(파일 용량 초과)");
			return;
		}
		try {
			int l_rn = Integer.parseInt(mr.getParameter("l_rn"));
			String l_name = mr.getParameter("l_name");
			int l_price = Integer.parseInt(mr.getParameter("l_price"));
			String l_content = mr.getParameter("l_content");
			String l_label = mr.getParameter("l_label");
			String l_photo=mr.getFilesystemName("l_photo");
			String l_video=mr.getFilesystemName("l_video");
			
			
			l.setL_rn(l_rn);
			l.setL_name(l_name);
			l.setL_content(l_content);
			l.setL_price(l_price);
			l.setL_label(l_label);
			l.setL_photo(l_photo);
			l.setL_video(l_video);
			
			if(ss.getMapper(LessonMapper.class).regLesson(l)==1) {
				request.setAttribute("r", "클래스 등록가 등록되었습니다:) ");
			}else {
				request.setAttribute("r", "등록실패");
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	public void updatelesson(Lesson l, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(path);
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(파일 용량 초과)");
			return;
		}
		try {
			int l_no =Integer.parseInt(mr.getParameter("l_no"));
			String l_name = mr.getParameter("l_name");
			int l_price = Integer.parseInt(mr.getParameter("l_price"));
			String l_content = mr.getParameter("l_content");
			String l_label = mr.getParameter("l_label");
			String l_photo=mr.getFilesystemName("l_photo");
			String l_photo_old =mr.getParameter("l_photo_old");
			String l_video=mr.getFilesystemName("l_video");
			String l_video_old = mr.getParameter("l_video_old");
			
			
			l.setL_no(l_no);
			l.setL_name(l_name);
			l.setL_content(l_content);
			l.setL_price(l_price);
			l.setL_label(l_label);
			
		if (l_photo != null) {
			l.setL_photo(l_photo);		
		}else if(l_photo == null) {
			l.setL_photo(l_photo_old);					
		}
		if(l_video != null) {
			l.setL_video(l_video);			
		}else if(l_video == null) {
			l.setL_video(l_video_old);				
		}
			
			if(ss.getMapper(LessonMapper.class).lessonUpdate(l)==1) {
				request.setAttribute("r", "클래스가 수정되었습니다 :) ");
			}else {
				request.setAttribute("r", "수정실패");
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	public void getAllLesson(HttpServletRequest request) {
		List<Lesson> lessons = ss.getMapper(LessonMapper.class).getAllLesson();
		request.setAttribute("lessons", lessons);
	}
	public void getLesson(Lesson l, HttpServletRequest request) {
		Lesson ll = ss.getMapper(LessonMapper.class).getLesson(l);
		request.setAttribute("l", ll);
	}
	
	public void deleteLesson(Lesson l, HttpServletRequest request) {
		System.out.println(request.getParameter("l_no"));
		l.setL_no(Integer.parseInt(request.getParameter("l_no")));
		if (ss.getMapper(LessonMapper.class).lessonDelete(l)==1) {
			request.setAttribute("r", "클래스가 삭제되었습니다.");
		}else {
			request.setAttribute("r", "삭제실패");
			
		}
		
		
	}
	
}
