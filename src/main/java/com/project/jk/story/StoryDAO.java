package com.project.jk.story;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.jk.common.Member;

@Service
public class StoryDAO {

   private int allStoryCnt;
   
   @Autowired
   private SqlSession ss;
   
   @Autowired
   private SiteOption so;
   
   public void regStory(Story s, HttpServletRequest req) {
	      
	      MultipartRequest mr = null;
	      String path = req.getSession().getServletContext().getRealPath("resources/img");

	      try {
	         mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
	         System.out.println(path);
	         
	         Member m = (Member) req.getSession().getAttribute("member_session");
	         
	         String s_title = mr.getParameter("s_title");
	         String s_content = mr.getParameter("s_content");
	         String s_photo = mr.getFilesystemName("s_photo");
	         
	         if(s_photo == null) {
	            s_photo = "temp";
	         }
	         
	         s_content = s_content.replace("\r\n", "<br>");
	         
	         s.setS_id(m.getM_id());
	         s.setS_title(s_title);
	         s.setS_content(s_content);
	         s.setS_photo(s_photo);
	         
	         if(ss.getMapper(StoryMapper.class).regStory(s) == 1) {
	            req.setAttribute("r", "등록 성공");
	            allStoryCnt++;
	         } else {
	            req.setAttribute("r", "등록 실패");
	            
	         }
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
   public Story getStory(Story s, HttpServletRequest req) {
      // detail 페이지에서 story 불러올 때 쓸 getstory. 댓글 안 들어가있음
      Story story = ss.getMapper(StoryMapper.class).getStory(s);
      req.setAttribute("st", story);
      return story;
   }

   public void delStory(Story s, HttpServletRequest req) {
      if(ss.getMapper(StoryMapper.class).delStory(s) == 1) {
         allStoryCnt--;
      };
      
   }

   public void updateStory(HttpServletRequest req) {
      String path = req.getSession().getServletContext().getRealPath("resources/img");
      System.out.println(path);
      MultipartRequest mr = null;
      Story s = new Story();
      
      try {
         mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
         BigDecimal s_no = new BigDecimal(mr.getParameter("s_no"));
         s.setS_no(s_no);
         s = getStory(s, req);
         String oldFile = s.getS_photo();
         
         String newFile = mr.getFilesystemName("s_photo");
         
         String s_title = mr.getParameter("s_title");
         String s_content = mr.getParameter("s_content");
         
         if (newFile == null) {
            newFile = oldFile;
         } else { 
         }
         
         s.setS_title(s_title);
         s.setS_content(s_content);
         s.setS_photo(newFile);
         
         if(ss.getMapper(StoryMapper.class).updateStory(s) == 1) {
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

   public void writeReply(StoryReply sr, HttpServletRequest req, HttpSession session) {
      Member member = (Member) req.getSession().getAttribute("member_session");
      
      sr.setSr_id(member.getM_id());
      
      ss.getMapper(StoryMapper.class).writeReply(sr);
      
   }
   
   public void countAllStory() {

      allStoryCnt = ss.getMapper(StoryMapper.class).getAllStoryCount();
   }
   
   public void getStories(int page, HttpServletRequest req) {
      req.setAttribute("curPage", page);

      String search = (String) req.getSession().getAttribute("search"); // 검색어로 쓸꺼
      
      int StoryCnt = 0;
      if (search == null) {
         StoryCnt = allStoryCnt;
         search = "";
      } else { 
         StorySelector sSel2 = new StorySelector(search, 0, 0);
         StoryCnt = ss.getMapper(StoryMapper.class).getSearchStoryCnt(sSel2);
      }

      int allPageCount = (int) Math.ceil((double) StoryCnt / so.getStoryPerPage());
      req.setAttribute("allPageCount", allPageCount);
      int start = (page - 1) * so.getStoryPerPage() + 1;

      int end = (page == allPageCount) ? StoryCnt : start + so.getStoryPerPage() - 1;

      StorySelector sSel = new StorySelector(search, start, end);
      List<Story> Stories = ss.getMapper(StoryMapper.class).getStoryP(sSel);

      for (Story story : Stories) {

         // 글 하나 하나에 해당하는 댓글
      List<StoryReply> replys = ss.getMapper(StoryMapper.class).getReply(story);
      story.setReply(replys);

      if (replys != null) {
         for (StoryReply sr : replys) {
            }
         }
      }

      // 댓글 들 가져오기
      req.setAttribute("stories", Stories);

   }
   
   public void searchStory(HttpServletRequest req) {
      String search = req.getParameter("search");
      System.out.println(search);
      req.getSession().setAttribute("search", search);

   }

   public void searchClear(HttpServletRequest req) {
      req.getSession().setAttribute("search", null);
   }
   
   public void getReply(StoryReply sr, Story s, HttpServletRequest request) {
      StoryReply reply =  ss.getMapper(StoryMapper.class).getReplyOne(sr);
      
      request.setAttribute("reply", reply);
   
   }
   
   public void getReplies(Story s, HttpServletRequest req) {
      Story story = ss.getMapper(StoryMapper.class).getStory(s);
      List<StoryReply> replys = ss.getMapper(StoryMapper.class).getReply(s);
      
      story.setReply(replys);
      
      
      req.setAttribute("reply", story);
   }

   public void delStoryReply(StoryReply sr, HttpServletRequest req) {
      ss.getMapper(StoryMapper.class).delStoryReply(sr);
      
   }

   public void updateReply(StoryReply sr, HttpServletRequest req, HttpSession session) {
      
      Member member = (Member) req.getSession().getAttribute("member_session");
      sr.setSr_id(member.getM_id());
      
      ss.getMapper(StoryMapper.class).updateReply(sr);
      
   }

   public void likeReg(StoryLike like, HttpServletRequest req, HttpSession session) {
      // 좋아요 누른 사람 id 등록
      ss.getMapper(StoryMapper.class).likeReg(like);
      // 그 게시글 count+1
      ss.getMapper(StoryMapper.class).likePlus(like);
   }

   public boolean confirmM_id(StoryLike like, HttpServletRequest req) {
      int ls_no = Integer.parseInt(req.getParameter("ls_no"));
      String lm_id = req.getParameter("lm_id");
      like.setLs_no(ls_no);
      like.setLm_id(lm_id);
      
      // 좋아요 누른적 있는 지 판단
      if(ss.getMapper(StoryMapper.class).confirmM_id(like) != null) {
         // 누른적 o = 좋아요 실패
         return false;
      } else {
         // 누른적 x = 좋아요 등록
         return true;
      }
   }

   public void likeDel(StoryLike like, HttpServletRequest req, HttpSession session) {
      // 좋아요 누른 사람 id 삭제
      ss.getMapper(StoryMapper.class).likeDel(like);
      // 그 게시글 count-1
      ss.getMapper(StoryMapper.class).likeMinus(like);
      
      
   }

   public List<StoryLike> likeCheck(StoryLike like, HttpServletRequest req) {
      
      // 좋아요 한 게시글들
       List<StoryLike> likes = ss.getMapper(StoryMapper.class).likeCheck(like);
            for (StoryLike s : likes) {
               System.out.println(s.getLs_no());
            }
      return likes;
   }



   
   
}