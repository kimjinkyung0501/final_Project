package com.project.jk.store.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.comment.P_CommentDAO;
import com.project.jk.common.MemberDAO;
import com.project.jk.store.StoreDAO;






@Controller
public class productController {
   
   @Autowired
   private ProductDAO pdao;
   @Autowired
   private P_CommentDAO pcdao;
   @Autowired
   private StoreDAO sdao;

   @Autowired
   private MemberDAO dao;

   @RequestMapping(value = "product.reg.go", method = RequestMethod.GET)
   public String productreg( HttpServletRequest request, HttpSession session) {
      dao.loginCheck(session, request);
      request.setAttribute("contentPage", "productPage/productReg.jsp");
      return "index" ;
   }
   @RequestMapping(value = "product.reg.do", method = RequestMethod.POST)
   public String productregdo(Product p, HttpServletRequest request, HttpSession session) {

      dao.loginCheck(session, request);
      pdao.regproduct(p,request);
      
      request.setAttribute("contentPage", "lessonPage/Result.jsp");
      return "index";
   }
   
   @RequestMapping(value = "product.delete", method = RequestMethod.GET)
   public String productdelete(Product p, HttpServletRequest request, HttpSession session) {
      dao.loginCheck(session, request);
      pdao.deleteProduct(p, request);
      
      request.setAttribute("contentPage", "lessonPage/Result.jsp");
      return "index";
   }
   @RequestMapping(value = "product.go", method = RequestMethod.GET)
   public String productgo(HttpServletRequest request, HttpSession session) {
      dao.loginCheck(session, request);
      pdao.getAllProduct(request);
      pdao.paging(1, request);
      pdao.getStore2(request);
      request.setAttribute("contentPage", "productPage/productView.jsp");
      return "index";
   }
      
   @RequestMapping(value = "product.paging", method = RequestMethod.GET)
   public String productpaging(HttpServletRequest request) {
      int p2 = Integer.parseInt(request.getParameter("p"));
      pdao.getStore2(request);
      pdao.paging(p2, request);
      request.setAttribute("contentPage", "productPage/productView.jsp");
      return "index";
   }
   @RequestMapping(value = "product.update.go", method = RequestMethod.GET)
   public String lessonupdatego(Product p, HttpServletRequest request) {
      pdao.getProduct(p, request);;
      request.setAttribute("contentPage", "productPage/productUpdate.jsp");
      return "index";
      
   }
   @RequestMapping(value = "product.update.do", method = RequestMethod.POST)
   public String lessonupdatedo(Product p, HttpServletRequest request, HttpSession session) {
      dao.loginCheck(session, request);
      pdao.updateproduct(p, request);
      request.setAttribute("contentPage", "lessonPage/Result.jsp");
      return "index";
      
   }
   
   
   @RequestMapping(value = "product.detail", method = RequestMethod.GET)
   public String sellerproductdetail(Product p, HttpServletRequest request, HttpSession session) {
      pcdao.getAllPComment(p, request);
      pcdao.paging(1, request);
      dao.loginCheck(session, request);
      sdao.getStoreInfo4(p, request);
      pdao.getProduct(p, request);
      request.setAttribute("contentPage", "productPage/userProductdetail.jsp"); 
      return "index";
   }
   
   @RequestMapping(value = "product.detail2", method = RequestMethod.GET)
   public String sellerproductdetail2(Product p, HttpServletRequest request, HttpSession session) {
      pdao.getProduct(p, request);
      Product pd =pdao.getProduct3(p, request);
      dao.loginCheck(session, request);
      sdao.getStoreInfo4(pd, request);
      pcdao.getAllPComment(pd, request);
      pcdao.paging(1, request);
      request.setAttribute("contentPage", "productPage/userProductdetail.jsp"); 
      return "index";
   }
   @RequestMapping(value = "product.label", method = RequestMethod.GET)
   public String productLabel(Product p, HttpServletRequest request) {
      pdao.Plabel(p,request);
      pdao.paging(1, request);
      pdao.getStore2(request);
      request.setAttribute("contentPage", "productPage/productView.jsp");
      return "index";
   }


   


   

}