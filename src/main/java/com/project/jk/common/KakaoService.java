package com.project.jk.common;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {
	
	@Autowired
	private KakaoMember kakaoMember;
	
	public String getAccessToken (String authorize_code) {
	String access_Token = "";
	String refresh_Token = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";
	
	try {
        URL url = new URL(reqURL);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
        
        //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        StringBuilder sb = new StringBuilder();
        sb.append("grant_type=authorization_code");
        sb.append("&client_id=97e12e516bb866800a64e5676c4184c1");  //본인이 발급받은 key
        sb.append("&redirect_uri=http://localhost:80/jk/common/kakao.login");  // 본인이 설정해 놓은 경로
        sb.append("&code=" + authorize_code);
        bw.write(sb.toString());
        bw.flush();

        //    결과 코드가 200이라면 성공
        //새로 고침을 했을 때 여기서 실패를 하는데...
        int responseCode = conn.getResponseCode();
        System.out.println("responseCode : " + responseCode);

        //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";

        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println("response body : " + result);

        //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);

        access_Token = element.getAsJsonObject().get("access_token").getAsString();
        refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

        System.out.println("access_token : " + access_Token);
        System.out.println("refresh_token : " + refresh_Token);

        br.close();
        bw.close();
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }

    return access_Token;
}
	
	public HashMap<String, Object> getUserInfo (String access_Token, HttpServletRequest request, HttpSession session) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
//            json 형태를 보여주는 코드
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String kakaoMemberId = element.getAsJsonObject().get("id").getAsString();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            JsonObject profile = (JsonObject) kakao_account.getAsJsonObject().get("profile");
            String profile_image = profile.getAsJsonObject().get("profile_image_url").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("kakaoMemberId", kakaoMemberId);
            userInfo.put("profile_nickname", nickname);
            userInfo.put("account_email", email);
            userInfo.put("profile_image", profile_image);
            
            kakaoMember.setKakaoMemberId(kakaoMemberId);
            kakaoMember.setKakao_nickname(nickname);
            kakaoMember.setKakao_email(email);
            kakaoMember.setKakao_profile_img(profile_image);
            kakaoMember.setAccess_token(access_Token);
            
            
            session = request.getSession();
            session.setAttribute("kakao_member_session", kakaoMember);
            int login_number = 2;
            
            session.setAttribute("login_number", login_number);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }

	public void logout(String access_token, HttpSession session, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			//카카오의 로그아웃 주소로 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//해당 주소를 염
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);
	        conn.setDoOutput(true);
	        //POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            System.out.println("3");
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            //요청을 통해 받아온 정보를 출력하는 BuffedWriter(작은 빨대에서 큰 빨대로)
            
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            session.removeAttribute("kakao_member_session");
            session.removeAttribute("login_number");
            session.invalidate();
			
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
	}
	
}
