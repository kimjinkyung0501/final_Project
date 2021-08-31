package com.project.jk.common;

import org.springframework.stereotype.Repository;

@Repository
//카카오톡으로 로그인 한 회원의 정보가 담기는 bean객체
public class KakaoMember {
	private String kakaoMemberId;
	private String kakao_nickname;
	private String kakao_email;
	private String kakao_profile_img;
	private String access_token;
	
	public KakaoMember() {
		// TODO Auto-generated constructor stub
	}

	public KakaoMember(String kakaoMemberId, String kakao_nickname, String kakao_email, String kakao_profile_img,
			String access_token) {
		super();
		this.kakaoMemberId = kakaoMemberId;
		this.kakao_nickname = kakao_nickname;
		this.kakao_email = kakao_email;
		this.kakao_profile_img = kakao_profile_img;
		this.access_token = access_token;
	}

	public String getKakaoMemberId() {
		return kakaoMemberId;
	}

	public void setKakaoMemberId(String kakaoMemberId) {
		this.kakaoMemberId = kakaoMemberId;
	}

	public String getKakao_nickname() {
		return kakao_nickname;
	}

	public void setKakao_nickname(String kakao_nickname) {
		this.kakao_nickname = kakao_nickname;
	}

	public String getKakao_email() {
		return kakao_email;
	}

	public void setKakao_email(String kakao_email) {
		this.kakao_email = kakao_email;
	}

	public String getKakao_profile_img() {
		return kakao_profile_img;
	}

	public void setKakao_profile_img(String kakao_profile_img) {
		this.kakao_profile_img = kakao_profile_img;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	
	
	
}
