package com.project.jk.story;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.jk.common.MemberDAO;


@Controller
public class StoryController {
   
   
   @Autowired
   private MemberDAO mdao;
   
   @Autowired
   private StoryDAO sdao;
   
   @RequestMapping(value = "/story.go", method = RequestMethod.GET)
   public String storyGo(HttpServletRequest request, HttpSession session) {
      
      sdao.countAllStory();
      sdao.searchClear(request);
      sdao.getStories(1, request);
      mdao.loginCheck(session, request);
      request.setAttribute("contentPage", "story/story.jsp");
      return "index";
   }
   
   @RequestMapping(value = "/story/story.reg.go", method = RequestMethod.GET)
   public String storyRegGo(HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         request.setAttribute("contentPage", "story/storyReg.jsp");
      }  else {
             request.setAttribute("contentPage", "loginHome.jsp");
      }
      return "index";
   }
   
   @RequestMapping(value = "/story/story.reg.do", method = RequestMethod.POST)
   public String storyRegDo(Story s, HttpServletRequest request, HttpSession session) {
      
      if (mdao.loginCheck(session, request)) {
         sdao.regStory(s, request);
         sdao.getStories(1, request);
         request.setAttribute("contentPage", "story/story.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");
      }
      return "index";
   }

   @RequestMapping(value = "/story/story.del", method = RequestMethod.GET)
   public String storyDel(Story s, HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         sdao.delStory(s, request);
         sdao.getStories(1, request);
         request.setAttribute("contentPage", "story/story.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");

      }
      return "index";
   }
   
   @RequestMapping(value = "/story/goUpdateStory", method = RequestMethod.GET)
   public String storyUpdateGo(Story s, HttpServletRequest request, HttpSession session) {
      if(mdao.loginCheck(session, request)) {
         sdao.getStory(s, request);
         request.setAttribute("contentPage", "story/storyUpdate.jsp");
      } else {
         sdao.getStories(1, request);
             request.setAttribute("contentPage", "loginHome.jsp");

      }
      return "index";
   }
   
   @RequestMapping(value = "/story/story.update.do", method = RequestMethod.POST)
   public String storyUpdate(Story s, HttpServletRequest request, HttpSession session) {
      
      if (mdao.loginCheck(session,request)) {
         sdao.updateStory(request);
      }
      request.setAttribute("contentPage", "story/storyDetail.jsp");
      return "index";
   }
   
   @RequestMapping(value = "/story.detail", method = RequestMethod.GET)
   public String storyDetail(Story s, HttpServletRequest request, HttpSession session) {
      
      mdao.loginCheck(session, request);
      sdao.getStory(s, request);
      sdao.getReplies(s, request);
      request.setAttribute("contentPage", "story/storyDetail.jsp");
      return "index";
   }
   
   @RequestMapping(value = "/story.write.reply", method = RequestMethod.GET)
   public String storyWriteReply(StoryReply sr, Story s, HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         sdao.writeReply(sr, request, session);
         sdao.getStory(s, request);
         sdao.getReplies(s, request);
         request.setAttribute("contentPage", "story/storyDetail.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");

         
      }
      return "index";
   }
   
   @RequestMapping(value = "/story/storyReply.del", method = RequestMethod.GET)
   public String storyReplyDel(StoryReply sr, Story s,HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         sdao.delStoryReply(sr, request);
         sdao.getStory(s, request);
         sdao.getReplies(s, request);
         request.setAttribute("contentPage", "story/storyDetail.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");

      }
      return "index";
   }
   
   @RequestMapping(value = "/story/storyReply.update.go", method = RequestMethod.GET)
   public String storyReplyUpdateGo(StoryReply sr, Story s, HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         sdao.getStory(s, request);
         sdao.getReply(sr, s, request);
         request.setAttribute("contentPage", "story/storyUpdateReply.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");
      }
      return "index";
   }
   
   @RequestMapping(value = "/story/storyReply.update.do", method = RequestMethod.GET)
   public String storyReplyUpdateDo(StoryReply sr, Story s,HttpServletRequest request, HttpSession session) {
      
      if(mdao.loginCheck(session, request)) {
         sdao.updateReply(sr, request, session);
         sdao.getStory(s, request);
         sdao.getReplies(s, request);
         request.setAttribute("contentPage", "story/storyDetail.jsp");
      } else {
             request.setAttribute("contentPage", "loginHome.jsp");

      }
      return "index";
   }
   
   @RequestMapping(value = "/story/story.page.change", method = RequestMethod.GET)
   public String paging(HttpServletRequest request, HttpSession session) {
      
         mdao.loginCheck(session, request);
         int p = Integer.parseInt(request.getParameter("p"));
         sdao.getStories(p, request);
         request.setAttribute("contentPage", "story/story.jsp");
         return "index";
   }
   
   @RequestMapping(value = "/story/story.search", method = RequestMethod.GET)
   public String search(HttpServletRequest request, HttpSession session) {
      
         sdao.searchStory(request);
         sdao.getStories(1, request);
         mdao.loginCheck(session, request);
         request.setAttribute("contentPage", "story/story.jsp");
      return "index";
   }
   
   @ResponseBody
   @RequestMapping(value = "story/like.reg")
   public boolean likeReg(StoryLike like, HttpServletRequest req, HttpSession session) {
      
      int ls_no = Integer.parseInt(req.getParameter("ls_no"));
      String lm_id = req.getParameter("lm_id");
      like.setLs_no(ls_no);
      like.setLm_id(lm_id);
      
      // 유저가 좋아요 눌렀는 지 판단
      if(sdao.confirmM_id(like, req)) {
         sdao.likeReg(like, req, session);
         return true;
      }
      else {
         return false;
      }
      
   }
      
      @ResponseBody
      @RequestMapping(value = "story/like.del")
      public void likeDel(StoryLike like, HttpServletRequest req, HttpSession session) {
         int ls_no = Integer.parseInt(req.getParameter("ls_no"));
         String lm_id = req.getParameter("lm_id");
         like.setLs_no(ls_no);
         like.setLm_id(lm_id);
         
         sdao.likeDel(like, req, session);
         
   }
      
      @ResponseBody
      @RequestMapping(value = "story/like.check")
      public List<StoryLike> likeCheck(StoryLike like, HttpServletRequest req, HttpSession session) {
         String lm_id = req.getParameter("lm_id");
         like.setLm_id(lm_id);
         return sdao.likeCheck(like, req);
         
      }
   
   
}