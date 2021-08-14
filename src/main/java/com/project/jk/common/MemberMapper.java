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

   public void changeProfile(Member member_session);

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
}