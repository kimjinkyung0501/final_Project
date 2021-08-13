package com.project.jk.store;

import com.project.jk.common.Member;

public interface StoreMapper {

	public int reg(Store s);

	public int gradeUp(Member m);

	public Store getStoreInfo(Store s);

	public Member getMemberInfo(Member m);

	public int gradedown(Member m);

	public int deleteStore(Store s);

	public int updateStore(Store s);

}
