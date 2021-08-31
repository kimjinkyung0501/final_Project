package com.project.jk.store;

import java.util.ArrayList;
import java.util.List;

import com.project.jk.common.Member;
import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.product.Product;


public interface StoreMapper {

	public int reg(Store s);

	public int gradeUp(Member m);

	public Store getStoreInfo(Store s);

	public Store getStoreInfo3(Store s);

	public Store getStoreInfo4(Product p);

	public List<Store> getStoreInfo2();

	public Member getMemberInfo(Member m);

	public int gradedown(Member m);

	public int deleteStore(Store s);

	public int updateStore(Store s);
	
	
	public ArrayList<Product> getproducts(Store s);
	public ArrayList<Lesson> getlessons(Store s);
}
