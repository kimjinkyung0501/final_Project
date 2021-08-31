package com.project.jk.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.jk.PagingVO;
import com.project.jk.common.Member;
import com.project.jk.message.Complain;
import com.project.jk.store.Store;

public interface AdminMapper {


	//총 멤버의 수
	public int countMember();
	public List<Member> getAllMember(PagingVO p);
	
	public int storeApprove(Member m);


	public int memberRenew(Member m);

	public List<Member> memberSeachByID(HashMap<String, String> map);
	public List<Member> memberSeachByName(HashMap<String, String> map);
	public List<Member> memberSeachByPhone(HashMap<String, String> map);
	public List<Member> memberSeachByAddr(HashMap<String, String> map);
	public List<Member> memberSeachByGrade(HashMap<String, String> map);
	public List<Member> memberSeachByEmail(HashMap<String, String> map);

	public void deleteShop(Member m);

	

	// 총 상정의 갯수
	public int countStore();
	public int countStore2();
	public int countStore3();
    public ArrayList<Store> getShopInfo(PagingVO p);
	public ArrayList<Store> getShopInfo2(PagingVO p);
	public ArrayList<Store> getShopInfo3(PagingVO p);

	
	// 불만 처리-- 신고 목록
	public int countComplain();
	public List<Complain> getComplains(PagingVO p);

	
	// 불만 처리-- 처리상태 갱신
	public void complainHandle_S(Complain c);
	public void complainHandle_C(Complain c);
	public void complainHandle_P(Complain c);

	// 불만 처리-- 처리상태 검색
	public List<Complain> complainSearch1(HashMap<String, String> c_map);
	public List<Complain> complainSearch2(HashMap<String, String> c_map);
	public List<Complain> complainSearch3(HashMap<String, String> c_map);
	public List<Complain> complainSearch4(HashMap<String, String> c_map);
	public List<Complain> complainSearch5(HashMap<String, String> c_map);
	public List<Complain> complainSearch6(HashMap<String, String> c_map);



	
	
	
}
