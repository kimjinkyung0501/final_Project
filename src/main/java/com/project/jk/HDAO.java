package com.project.jk;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HDAO {

	
	
	@Autowired
	private SqlSession ss;

	public void searchAll(HttpServletRequest req, String keyword, HttpSession session) {
		System.out.println("a");
		//전체 리스트가 담기는 리스트
		ArrayList<SearchBean> finalResult = new ArrayList<SearchBean>();
		
		//검색 키워드에 따른 각각의 결과들이 담김
		List<SearchBean> resultStore = ss.getMapper(SearchMapper.class).searchByStore(keyword);
		List<SearchBean> resultProduct = ss.getMapper(SearchMapper.class).searchByProduct(keyword);
		List<SearchBean> resultLesson = ss.getMapper(SearchMapper.class).searchByLesson(keyword);
		
		
		for (SearchBean rs : resultStore) {
				//store의 label을 추가
				rs.setC_label("Store");
				//store에 카테고리 구분을 1로 설정
				rs.setCategory("1");
				finalResult.add(rs);
		}
		
		for (SearchBean rp : resultProduct) {
			rp.setCategory("2");
			finalResult.add(rp);
		}
		
		for (SearchBean rl : resultLesson) {
			rl.setCategory("3");
			finalResult.add(rl);
		}
		
		
		session.setAttribute("keyword", keyword);
		req.setAttribute("list", finalResult);
	}

	public boolean  searchClass(HttpServletRequest req, String keyword) {
		List<SearchBean> list =	ss.getMapper(SearchMapper.class).searchByLesson(keyword);
		req.setAttribute("list", list);
		
		return true;
	}
	
	public boolean  searchProduct(HttpServletRequest req, String keyword) {
		List<SearchBean> list =	ss.getMapper(SearchMapper.class).searchByProduct(keyword);
		req.setAttribute("list", list);
		
		return true;
	}
	
	public boolean  searchStore(HttpServletRequest req, String keyword) {
		List<SearchBean> list =	ss.getMapper(SearchMapper.class).searchByStore(keyword);
		req.setAttribute("list", list);
		
		return true;
	}


	
}
