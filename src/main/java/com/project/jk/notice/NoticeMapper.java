package com.project.jk.notice;

import java.util.ArrayList;
import java.util.List;


public interface NoticeMapper {

	public ArrayList<Notice> noticeAll();

	public int regNotice(Notice n);

	public Notice getNotice(Notice n);

	public int delNotice(Notice n);

	public int updateNotice(Notice n);
	
	public int updateNoticeCnt(Notice n);


	

	

}
