package com.project.jk.notice;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.jk.common.Member;

@Service
public class NoticeDAO {

	@Autowired
	private SqlSession ss;

	public void noticeAll(HttpServletRequest req) {
		List<Notice> notices = ss.getMapper(NoticeMapper.class).noticeAll();
		req.setAttribute("notices", notices);
	}

	public void regNotice(Notice n, HttpServletRequest req) {
		MultipartRequest mr = null;
		String path = req.getSession().getServletContext().getRealPath("resources/img");

		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			System.out.println(path);
			
			Member m = (Member) req.getSession().getAttribute("member_session");
			System.out.println(m.getM_id());
			
			String n_title = mr.getParameter("n_title");
			String n_content = mr.getParameter("n_content");
			String n_photo = mr.getFilesystemName("n_photo");
			
			n.setN_id(m.getM_id());
			n.setN_title(n_title);
			n.setN_content(n_content);
			n.setN_photo(n_photo);
			
			if(ss.getMapper(NoticeMapper.class).regNotice(n) == 1) {
				req.setAttribute("r", "등록 성공");
			} else {
				req.setAttribute("r", "등록 실패");
				
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void getNotice(Notice n, HttpServletRequest req) {
		Notice notice = ss.getMapper(NoticeMapper.class).getNotice(n);
		req.setAttribute("nt", notice);
	}

	public void delNotice(Notice n, HttpServletRequest req) {
		ss.getMapper(NoticeMapper.class).delNotice(n);
	}

	public void updateNotice(Notice n, HttpServletRequest req) {
		MultipartRequest mr = null;
		String path = req.getSession().getServletContext().getRealPath("resources/img");

		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			System.out.println(path);
			
			Member m = (Member) req.getSession().getAttribute("member_session");
			
			System.out.println(n.getN_id());
			System.out.println(n.getN_content());
			
			String n_title = mr.getParameter("n_title");
			String n_content = mr.getParameter("n_content");
			String n_photo = mr.getFilesystemName("n_photo");
			
			n.setN_id(m.getM_id());
			n.setN_title(n_title);
			n.setN_content(n_content);
			n.setN_photo(n_photo);
			
			if(ss.getMapper(NoticeMapper.class).updateNotice(n) == 1) {
				req.setAttribute("r", "수정 성공");
			} else {
				req.setAttribute("r", "수정 실패");
				
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
