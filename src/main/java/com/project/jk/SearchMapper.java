package com.project.jk;

import java.util.List;

public interface SearchMapper {

	//전체 검색 했을 때 상점 리스트
		public List<SearchBean> searchByStore(String keyword);

		//전체 검색 했을 때 제품 리스트
		public List<SearchBean> searchByProduct(String keyword);

		//전체 검색 했을 때 수업 리스트
		public List<SearchBean> searchByLesson(String keyword);

	
}
