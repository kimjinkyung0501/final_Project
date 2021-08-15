package com.project.jk.store.product;

import java.util.List;



public interface ProductMapper {

	public int productReg(Product p);
	
	public List<Product> getAllProduct();

	public Product getProduct(Product p);
	
	public int deleteProduct(Product p);
	
	public int updateProduct(Product p);

	public List<Product> searchHomeProduct(String keyword);



	

}
