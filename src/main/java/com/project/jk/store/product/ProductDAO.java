package com.project.jk.store.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.jk.order.p_order;
import com.project.jk.store.Store;
import com.project.jk.store.StoreMapper;

@Service
public class ProductDAO {
	@Autowired
	private SqlSession ss;
	
	private ArrayList<Product> products;

	public void regproduct(Product p, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(path);
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(파일 용량 초과)");
			return;
		}
		try {
			int p_rn = Integer.parseInt(mr.getParameter("p_rn"));
			String p_name = mr.getParameter("p_name");
			int p_stock = Integer.parseInt(mr.getParameter("p_stock"));
			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			String p_content = mr.getParameter("p_content");
			String p_label = mr.getParameter("p_label");
			String p_option = mr.getParameter("p_option");
			String p_photo1 = mr.getFilesystemName("p_photo1");
			String p_photo2 = mr.getFilesystemName("p_photo2");
			String p_photo3 = mr.getFilesystemName("p_photo3");
			

			p_content = p_content.replace("\r\n", "<br>");

			
			p.setP_rn(p_rn);
			p.setP_name(p_name);
			p.setP_stock(p_stock);
			p.setP_content(p_content);
			p.setP_price(p_price);
			p.setP_label(p_label);
			p.setP_option(p_option);
			p.setP_photo1(p_photo1);
			
		if (p_photo2!=null) {
			p.setP_photo2(p_photo2);			
		}else {
			p.setP_photo2("없다");
		}
		if(p_photo3!= null) {
			p.setP_photo3(p_photo3);
		}else {
			p.setP_photo3("없다");
		}

		
		
		
			if (ss.getMapper(ProductMapper.class).productReg(p) == 1) {
				request.setAttribute("r", "제품이 등록되었습니다 :) ");
			} else {
				request.setAttribute("r", "제품 등록에 실패하였습니다.");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public void updateproduct(Product p, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(path);
		} catch (IOException e) {
			e.printStackTrace();
			request.setAttribute("r", "등록실패(파일 용량 초과)");
			return;
		}
		try {
			int p_no = Integer.parseInt(mr.getParameter("p_no"));
			String p_name = mr.getParameter("p_name");
			int p_stock = Integer.parseInt(mr.getParameter("p_stock"));
			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			String p_content = mr.getParameter("p_content");
			String p_label = mr.getParameter("p_label");
			String p_photo1 = mr.getFilesystemName("p_photo1");
			String p_photo1_old = mr.getParameter("p_photo1_old");
			String p_photo2 = mr.getFilesystemName("p_photo2");
			String p_photo2_old = mr.getParameter("p_photo2_old");
			String p_photo3 = mr.getFilesystemName("p_photo3");
			String p_photo3_old = mr.getParameter("p_photo3_old");
			
			System.out.println(p_photo1_old);
			System.out.println(p_photo2_old);
			System.out.println(p_photo3_old);
			
			p_content = p_content.replace("\r\n", "<br>");

			
			p.setP_no(p_no);
			p.setP_name(p_name);
			p.setP_stock(p_stock);
			p.setP_content(p_content);
			p.setP_price(p_price);
			p.setP_label(p_label);
			
			
			if(p_photo1!=null) {
			p.setP_photo1(p_photo1);
			}else  {
				p.setP_photo1(p_photo1_old);
			}
			
			if (p_photo2!=null) {
				p.setP_photo2(p_photo2);			
			}else if(p_photo2==null || p_photo2_old.equals("없다")) {
				p.setP_photo2("없다");
			}
			else {
				p.setP_photo2(p_photo2_old);				
			}
			if(p_photo3!= null) {
				p.setP_photo3(p_photo3);
			}else if(p_photo3==null||p_photo3_old.equals("없다")){
				p.setP_photo3("없다");
			}else {
				p.setP_photo3(p_photo3_old);
			}
			
			if (ss.getMapper(ProductMapper.class).updateProduct(p) == 1) {
				request.setAttribute("r", "제품이 수정되었습니다 :) ");
			} else {
				request.setAttribute("r", "제품수정 실패");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void getAllProduct(HttpServletRequest request) {
		 products = ss.getMapper(ProductMapper.class).getAllProduct();
		request.setAttribute("products", products);
		
	}
	public void getProduct(Product p, HttpServletRequest request) {
		Product product = ss.getMapper(ProductMapper.class).getProduct(p);
		request.setAttribute("p", product);
		
	}
	public void getProduct2(Product p, HttpServletRequest request) {
		Product product = ss.getMapper(ProductMapper.class).getProduct(p);
		request.setAttribute("product", product);
		
	}
	public void deleteProduct(Product p, HttpServletRequest request) {
		System.out.println(request.getParameter("p_no"));
		p.setP_no(Integer.parseInt(request.getParameter("p_no")));
		if (ss.getMapper(ProductMapper.class).deleteProduct(p)==1) {
			request.setAttribute("r", "제품이 삭제되었습니다 :) ");
		}else {
			request.setAttribute("r", "삭제에 실패하였습니다.");
			
		}
		
		
	}
	
	public void getStore2( HttpServletRequest request) {
		List<Store> stores = ss.getMapper(StoreMapper.class).getStoreInfo2();
		request.setAttribute("stores", stores);

		
	}
	public void paging(int page, HttpServletRequest request) {
		request.setAttribute("curPageNO", page);

		int cnt = 12; // 
		int total = products.size(); 
		if (total != 0) {
		int pageCount = (int) Math.ceil(total / (double) cnt);

		request.setAttribute("pageCount", pageCount);

		int start = total - (cnt * (page - 1));

		int end = (page == pageCount) ? -1 : start - (cnt + 1);

		ArrayList<Product> items = new ArrayList<Product>();
		for (int i = start - 1; i > end; i--) {
			items.add(products.get(i));
		}

		request.setAttribute("products", items);
		
	}
	
	
	}
	
	public void paging2(int page, HttpServletRequest request) {
		request.setAttribute("curPageNO", page);
		
		int cnt = 3; // 
		int total = products.size(); 
		if (total != 0) {
			int pageCount = (int) Math.ceil(total / (double) cnt);
			
			request.setAttribute("pageCount", pageCount);
			
			int start = total - (cnt * (page - 1));
			
			int end = (page == pageCount) ? -1 : start - (cnt + 1);
			
			ArrayList<Product> items = new ArrayList<Product>();
			for (int i = start - 1; i > end; i--) {
				items.add(products.get(i));
			}
			
			request.setAttribute("products", items);
			
		}
		
		
	}
	
	public void storeProduct(Store s, HttpServletRequest request) {
		 products = ss.getMapper(StoreMapper.class).getproducts(s);
		 request.setAttribute("products", products);
	}
	
	public void insertCart(p_order po, HttpServletRequest request) {
		ss.getMapper(ProductMapper.class).insertCart(po);
		
	}
	public void Plabel(Product p, HttpServletRequest request) {
		products=ss.getMapper(ProductMapper.class).getProductLabel(p);
		
	}
	
	public Product getProduct3(Product p, HttpServletRequest request) {
		Product product = ss.getMapper(ProductMapper.class).getProduct(p);
		return product;
	}
	public void getAllProduct2(Store s, HttpServletRequest request) {
		 products = ss.getMapper(ProductMapper.class).getAllProduct2(s);
		request.setAttribute("products", products);
		
	}

}
