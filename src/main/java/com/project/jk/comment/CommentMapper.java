package com.project.jk.comment;

import java.util.ArrayList;

import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.product.Product;

public interface CommentMapper {

	public int p_commentReg(P_Comment pc);
	public int p_commentdelete(P_Comment pc);
	public ArrayList<P_Comment> getAllP_comment(Product p);
	public int p_commentUpdate(P_Comment pc);
	
	public int l_commentReg(L_Comment lc);
	public int l_commentdelete(L_Comment lc);
	public ArrayList<L_Comment> getAllL_comment(Lesson l);
	public int l_commentUpdate(L_Comment lc);
}
