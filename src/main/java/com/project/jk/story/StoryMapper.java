package com.project.jk.story;

import java.util.List;

public interface StoryMapper {

   public List<Story> storyAll();

   public int regStory(Story s);

   public Story getStory(Story s);

   public int delStory(Story s);

   public int updateStory(Story s);

   public int writeReply(StoryReply sr);
   
   public List<Story> getStoryP(StorySelector s);

   public int getAllStoryCount();
   
   public int getSearchStoryCnt(StorySelector sSel);

   public StoryReply getReplyOne(StoryReply sr);
   
   public List<StoryReply> getReply(Story s);

   public int delStoryReply(StoryReply sr);

   public int updateReply(StoryReply sr);

   public void likeReg(StoryLike like);

   public void likePlus(StoryLike like);

   public Integer confirmM_id(StoryLike like);

   public int likeDel(StoryLike like);

   public void likeMinus(StoryLike like);

   public  List<StoryLike> likeCheck(StoryLike like);




}