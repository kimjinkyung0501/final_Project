package com.project.jk.store;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.jk.common.Member;


@Service
public class StoreDAO {
	@Autowired
	private SqlSession ss;
	
	public void reg(Store s, HttpServletRequest request) {
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
			String s_id=mr.getParameter("s_id");
			String s_name=mr.getParameter("s_name");
			String s_exp=mr.getParameter("s_exp");
			String s_img=mr.getFilesystemName("s_img");
			s_img = URLEncoder.encode(s_img, "utf-8");	//왜지? 어차피 utf-8로 받았는데
			s_img = s_img.replace("+", " ");
			s.setS_id(s_id);
			s.setS_name(s_name);
			s.setS_exp(s_exp);
			s.setS_img(s_img);
			if(ss.getMapper(StoreMapper.class).reg(s)==1) {
				request.setAttribute("r", "입점 성공");
			}else {
				
				request.setAttribute("r", "입점 실패");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(DB 서버문제)");
			String s_img = mr.getFilesystemName("s_img");
			File f = new File(path + "/" + s_img);
			f.delete();
		}
		
		
		
	}
	public void gradeup(Member m, HttpServletRequest request) {
		
		
		try {
			String m_id=request.getParameter("m_id");
			m.setM_id(m_id);
			
			if(ss.getMapper(StoreMapper.class).gradeUp(m)==1) {
				
			}else {
				
			
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
	}
	public void gradedown(Member m, HttpServletRequest request) {
		
		
		try {
			String m_id=request.getParameter("m_id");
			m.setM_id(m_id);
			
			if(ss.getMapper(StoreMapper.class).gradedown(m)==1) {
				request.setAttribute("r", "성공");
			}else {
				
				request.setAttribute("r", "실패");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
	}
	
	public void getMemberInfo(Member m, HttpServletRequest request) {
		Member mm = ss.getMapper(StoreMapper.class).getMemberInfo(m);
		
		request.setAttribute("m", mm);
		
		
	}
	public void getStoreInfo(Store s, HttpServletRequest request) {
		
		Store sss = ss.getMapper(StoreMapper.class).getStoreInfo(s);
		request.setAttribute("s", sss);
		
	}
	public void deleteStore(Store s, HttpServletRequest request) {
		
		 if(ss.getMapper(StoreMapper.class).deleteStore(s)==1) {
			 request.setAttribute("r", "폐점되었습니다");
		 }else {
			 request.setAttribute("r", "오류가 발생했습니다");
			 
		 }
		
		
	}
	
	public void updateStore(Store s, HttpServletRequest request) {
		
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
			System.out.println(mr.getParameter("s_id"));
			System.out.println(mr.getFilesystemName("s_img"));
			System.out.println(mr.getParameter("s_img_old"));
			
			String s_id=mr.getParameter("s_id");
			String s_name=mr.getParameter("s_name");
			String s_exp=mr.getParameter("s_exp");
			String s_img=mr.getFilesystemName("s_img");
			String s_img_old=mr.getParameter("s_img_old");

			s.setS_id(s_id);
			s.setS_name(s_name);
			s.setS_exp(s_exp);
		if (s_img != null) {
			s.setS_img(s_img);			
		}else {
			s.setS_img(s_img_old);
		}
		
			if(ss.getMapper(StoreMapper.class).updateStore(s)==1) {
				request.setAttribute("r", "수정성공");
			}else {
				
				request.setAttribute("r", "수정실패");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(DB 서버문제)");
			String s_img = mr.getFilesystemName("s_img");
			File f = new File(path + "/" + s_img);
			f.delete();
		}
		
	}
	
	
	
}
