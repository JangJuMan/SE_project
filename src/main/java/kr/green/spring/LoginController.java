package kr.green.spring;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.social.google.connect.GoogleConnectionFactory;
//import org.springframework.social.oauth2.GrantType;
//import org.springframework.social.oauth2.OAuth2Operations;
//import org.springframework.social.oauth2.OAuth2Parameters;

import com.github.scribejava.core.model.OAuth2AccessToken;
/**
* Handles requests for the application home page.
*/
@Controller
public class LoginController {
	
//	/* GoogleLogin */
//	@Autowired
//	private GoogleConnectionFactory googleConnectionFactory;
//	
//	@Autowired
//	private OAuth2Parameters googleOAuth2Parameters;
//	
//	// 구글 Callback호출 메소드
//	@RequestMapping(value = "/callbackGoogle", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callbackGoogle(Model model, @RequestParam String code) throws IOException {
//		System.out.println("여기는 callbackGoogle");
//		// 1. code 이용해서 access_token 받기
//		// 2. access_token 이용해서 사용자 profile 정보 가져오기
//		// 3. DB에 해당 유저가 존재하는 체크 (google_id, naver_id?)email?
//		// 4. 존재 시 강제로그인, 미존재시 가입페이지 
//		return "googleSuccess";
//	}
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
//		/* 구글code 발행 */
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//		System.out.println("구글:" + url);
//
//		model.addAttribute("google_url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callbackNaver", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String naver_id = (String)response_obj.get("id");
		String naver_nickname = (String)response_obj.get("nickname");
		String naver_age = (String)response_obj.get("age");
		String naver_gender = (String)response_obj.get("gender");
		String naver_email = (String)response_obj.get("email");
		String naver_name = (String)response_obj.get("name");
		System.out.println(naver_id);
		System.out.println(naver_nickname);
		System.out.println(naver_age);
		System.out.println(naver_gender);
		System.out.println(naver_email);
		System.out.println(naver_name);
		
		//4.파싱 닉네임 세션으로 저장
//		session.setAttribute("naver_id",naver_id); //세션 생성
		session.setAttribute("nickname",naver_nickname); //세션 생성
		session.setAttribute("age",naver_age); //세션 생성
		session.setAttribute("gender",naver_gender); //세션 생성
		session.setAttribute("email",naver_email); //세션 생성
		session.setAttribute("user_name",naver_name); //세션 생성
		session.setAttribute("session_validity", true);
		model.addAttribute("name", apiResult);
//		return "login";
		return "naverSuccess";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		System.out.println("여기는 logout");
//		session.invalidate();
		session.setAttribute("session_validity", false);
		return "redirect:index.jsp";
	}
}