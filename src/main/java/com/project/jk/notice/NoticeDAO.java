package com.project.jk.notice;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
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
	
	private ArrayList<Notice> notices;

	public void noticeAll(HttpServletRequest req) {
		 notices = ss.getMapper(NoticeMapper.class).noticeAll();
		req.setAttribute("notices", notices);
	}

	public void regNotice(Notice n, HttpServletRequest req) {
		
//		String token = req.getParameter("token");
//		String st = (String) req.getSession().getAttribute("seccessToken");
//		
//		if(st != null && token.equals(st)) {
//			
//		}
//		
		MultipartRequest mr = null;
		String path = req.getSession().getServletContext().getRealPath("resources/img");

		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			
			Member m = (Member) req.getSession().getAttribute("member_session");
			
			String n_title = mr.getParameter("n_title");
			String n_content = mr.getParameter("n_content");
			String n_photo = mr.getFilesystemName("n_photo");
			
			if(n_photo == null) {
				n_photo = "temp";
			}
			
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

	public Notice getNotice(Notice n, HttpServletRequest req) {
		Notice notice = ss.getMapper(NoticeMapper.class).getNotice(n);
		req.setAttribute("nt", notice);
		return notice;
	}

	public void delNotice(Notice n, HttpServletRequest req) {
		ss.getMapper(NoticeMapper.class).delNotice(n);
	}

	public void updateNotice(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		Notice n = new Notice();
		
		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
			BigDecimal n_no = new BigDecimal(mr.getParameter("n_no"));
			n.setN_no(n_no);
			n = getNotice(n, req);
			String oldFile = n.getN_photo();
			
			String newFile = mr.getFilesystemName("n_photo");
			
			String n_title = mr.getParameter("n_title");
			String n_content = mr.getParameter("n_content");
			
			if (newFile == null) {
				newFile = oldFile;
			} else { 
			}
			
			n.setN_title(n_title);
			n.setN_content(n_content);
			n.setN_photo(newFile);
			
			if(ss.getMapper(NoticeMapper.class).updateNotice(n) == 1) {
				req.setAttribute("r", "수정 성공");
				
				if(!oldFile.equals(newFile)) {
					new File(path + "/" + oldFile).delete();
				}
				
			} else {
				req.setAttribute("r", "수정 실패");
				
				if(!oldFile.equals(newFile)) {
					new File(path + "/" + newFile).delete();
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			req.setAttribute("r", "수정 실패");
		}
		
	}

	public void updateNoticeCnt(Notice n, HttpServletRequest req) {
		ss.getMapper(NoticeMapper.class).updateNoticeCnt(n);
	}

	public void paging(int page, HttpServletRequest request) {

		request.setAttribute("curPageNO", page);

		int cnt = 10;
		int total = notices.size(); 
		if (total != 0) {
		int pageCount = (int) Math.ceil(total / (double) cnt);

		request.setAttribute("pageCount", pageCount);

		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<Notice> items = new ArrayList<Notice>();
		for (int i = start - 1; i > end; i--) {
			items.add(notices.get(i));
		}

		request.setAttribute("notices", items);
		}
	
	}
	
	
	

}
