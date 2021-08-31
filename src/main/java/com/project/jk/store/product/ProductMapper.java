package com.project.jk.store.product;

import java.util.ArrayList;

import com.project.jk.order.p_order;
import com.project.jk.order.p_order2;
import com.project.jk.store.Store;


public interface ProductMapper {

	public int productReg(Product p);
	
	public ArrayList<Product> getAllProduct();

	public Product getProduct(Product p);
	
	public int deleteProduct(Product p);
	
	public int updateProduct(Product p);


	public int insertCart(p_order po);

	public ArrayList<Product> getProductLabel(Product p);

	public ArrayList<Product> getAllProduct2(Store s);

}
