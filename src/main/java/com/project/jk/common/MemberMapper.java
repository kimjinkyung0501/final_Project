package com.project.jk.common;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {

   public Member loginCheck(Member member);

   public List<Member> checkId_select(Member m);

   public int insertPhoneKey(String Key);

   public List<MemberPhoneCheck> compareKey(MemberPhoneCheck key);

   public int updateSuccessInfo();

   public MemberPhoneCheck checkSuccessInfo(MemberPhoneCheck mpc);

   public int insertKey(TempMemberInfo tmi);

   public int updateTempMemberInfo(TempMemberInfo tmi);

   public int regMember(Member member);

   public int insertTempInfo(TempMemberInfo tmp);

   public void changeName(DataChangeBean dcb);

   public void changeId(DataChangeBean dcb);

   public Member comparePw(Member member);

   public int changePw(Member member);

   public int changeProfile(Member member_session);

   public int checkEmail(TempMemberInfo tmi);

   public int changeMemberEmail(TempMemberInfo tmi);

   public Member searchIdByNameAndEmail(Member member);

   public void changePwWithTempPw(HashMap<String, String> tempPwMap);

   public TempMemberInfo checkEmailSuccess(TempMemberInfo tmi);

   public int regAddr(Member member);

   public Member searchIdByPhone(Member member);

   public int updatePhoneKey(MemberPhoneCheck mpk);

   public int memberUniqueNo(String userPhoneNumber);

   public Member getUserEmail(Member member);

   public List<OrderPage> getUserCart(Member member);

   // 8월 16일 작업
   public int deleteOrder(OrderPage order);

   public int idCheck(Member member);

   public Member compareId(Member member);

   public int changeQuantidey(HashMap<String, Integer> quantidey);

   public void confirmOrder(ConfirmOrder co);

   public void decreaseQuantidey(ConfirmOrder co);

   public void deleteCart(ConfirmOrder co);

   public List<ConfirmOrder> getCompletedOrder(Member member);

   public ConfirmOrder getOrderList(int p2_no);

   public int getPrimary(ConfirmOrder co);

   public ConfirmOrder fromShopPage(String m_id);

   
   
   public List<LessonBean> getLessonList(Member session_member);

   public LessonBean getMovie(int l_no);

   public void deleteTempInfo(String t_m_id);
   
   
   
   //8월 24일 작업
	public int getOrderCount(Member session_member);

	public int getLessonCount(Member session_member);

	public void deleteTempInfo(TempMemberInfo tmi);

	public void changeMemberKey(TempMemberInfo tmi);

	public String compareEmailKey(String m_email);

	public void deleteOldPhoneInfo(Member member);


}