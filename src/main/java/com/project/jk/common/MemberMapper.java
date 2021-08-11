package com.project.jk.common;


import java.util.List;

public interface MemberMapper {

	public Member loginCheck(Member member);

	public List<Member> checkId_select(Member m);
	
	public int insertPhoneKey(String Key);
	
	public List<MemberPhoneKey> compareKey(MemberPhoneKey key);
	
	public int updateSuccessInfo();

	public List<MemberPhoneKey> checkSuccessInfo(MemberPhoneKey mpk);

	public int insertKey(TempMemberInfo tmi);

	public int updateTempMemberInfo(TempMemberInfo tmi);

	public int regMember(Member member);

	public int insertTempInfo(TempMemberInfo tmp);

	public void changeName(DataChangeBean dcb);

	public void changeId(DataChangeBean dcb);

	public Member comparePw(Member member);

	public int changePw(Member member);

	public void changeProfile(Member member_session);


}
