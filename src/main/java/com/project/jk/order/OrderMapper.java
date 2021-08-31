package com.project.jk.order;

import java.util.ArrayList;

import com.project.jk.store.product.Product;

public interface OrderMapper {

	public int pOrderReg(p_order2 po2);
	public int lOrderReg(L_order lo);
	
	public int minusStock(p_order2 po2);
	public int returnStock(p_order2 po2);
	public void deletePorder(p_order2 po2);
	public ArrayList<p_order2> PordercConfrim(Product p);
	
	//제품 순위
	public ArrayList<p_order2> rankProduct();
	
	

	
	
}
