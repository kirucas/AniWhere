package com.animal.aniwhere.web.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;
import com.animal.aniwhere.service.impl.member.MemberServiceImpl;
import com.animal.aniwhere.service.member.AnimalDTO;
import com.animal.aniwhere.service.member.MemberDTO;
import com.animal.aniwhere.service.member.NaverLoginBO;
import com.animal.aniwhere.web.board.FileUpDownUtils;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {
	private String apiResult = null;

	@Resource(name = "naverLoginBO")
	private NaverLoginBO naverLoginBO;

	@Resource(name = "memberService")
	private MemberServiceImpl service;

	@Resource(name = "animalService")
	private AnimalServiceImpl aniservice;

	@Autowired
	PasswordEncoder passwordEncoder;

	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	private OAuth2Operations oauthOperations;

	@RequestMapping(value = "/login.aw", method = { RequestMethod.GET, RequestMethod.POST })
	public String go_login(Model model, HttpSession session) throws Exception {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);

		return "member/sign_in";
	}////////// go_login

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/Member/naver/Callback.aw", method = { RequestMethod.GET, RequestMethod.POST })
	public String navercallback(@RequestParam Map map, Model model, @RequestParam String code,
			@RequestParam String state, HttpSession session) throws Exception {

		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		/*
		 * {"resultcode":"00","message":"success","response":
		 * {"id":"47126902","nickname":"\ucd08\uc2ec\uc790",
		 * "gender":"M","email":"wmffkdla@naver.com",
		 * "name":"\ucd5c\uc131\uc6b1","birthday":"02-28"} }
		 */

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(apiResult);
		JSONObject jsonResult = (JSONObject) jsonObject.get("response");
		map.put("mem_id", jsonResult.get("id").toString());
		map.put("mem_pw", 8124908);
		map.put("mem_nickname", jsonResult.get("nickname").toString());
		map.put("mem_gender", jsonResult.get("gender").toString());
		map.put("mem_name", jsonResult.get("name").toString());
		map.put("mem_log", 1);
		map.put("mem_interani", "0");
		MemberDTO dto = service.selectOne(map);
		// 네이버로 로그인 한적이 있으면 일로 나감.
		if (dto != null) {
			session.setAttribute("mem_id", map.get("mem_id"));
			session.setAttribute("mem_no", dto.getMem_no());
			return "forward:/main.aw";
		}
		int signup = service.insert(map);
		dto = service.selectOne(map);
		if (signup == 2)
			model.addAttribute("check", 2);
		else
			model.addAttribute("check", 0);

		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_no", dto.getMem_no());

		return "forward:/signInProcess.aw";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/Member/google/Callback.aw", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam Map map, @RequestParam String code, HttpSession session)
			throws Exception {

		oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();

		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}

		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		System.out.println(connection);

		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		// Access Token 닫아주기
		try {
			System.out.println("Closing Token....");
			String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
			URL url = new URL(revokeUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
		} catch (Exception e) {

			e.printStackTrace();
		}

		map.put("mem_id", profile.getId());
		map.put("mem_pw", 8124908);
		map.put("mem_nickname", profile.getDisplayName());
		map.put("mem_gender", "U");
		map.put("mem_name", profile.getDisplayName());
		map.put("mem_log", 2); // 구글 로그인 연동
		map.put("mem_interani", "0");
		MemberDTO dto = service.selectOne(map);
		// 구글로 로그인 한적이 있으면 일로 나감.
		if (dto != null) {
			session.setAttribute("mem_id", map.get("mem_id"));
			session.setAttribute("mem_no", dto.getMem_no());
			return "forward:/main.aw";
		}
		int signup = service.insert(map);
		dto = service.selectOne(map);
		if (signup == 2)
			model.addAttribute("check", 3);
		else
			model.addAttribute("check", 0);

		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_no", dto.getMem_no());

		return "member/sign_process";

	}////////////// googleCallback

	@RequestMapping("/animal/enroll.aw")
	public String animal_enroll() throws Exception {

		return "member/animal_enroll";
	}////////// animal_enroll

	@RequestMapping("/signIn/security.aw")
	public String security(Authentication auth, HttpSession session) throws Exception {
		System.out.println("인증된 사용자:" + auth.getPrincipal());
		UserDetails authenticatedUser = ((UserDetails) auth.getPrincipal());
		System.out.println(authenticatedUser.getUsername());
		System.out.println(authenticatedUser.getAuthorities().toString());
		Map map = new HashMap<>();
		map.put("mem_id", authenticatedUser.getUsername());
		MemberDTO dto = service.selectOne(map);
		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_no", dto.getMem_no());

		return "forward:/";
	}/// security

	/*
	 * @RequestMapping(value = "/signInProcess.aw", method = RequestMethod.POST)
	 * public String signInProcess(@RequestParam Map map, HttpSession session, Model
	 * model) throws Exception { if(!service.isMember(map)) {
	 * model.addAttribute("sign_error", "ID 혹은 Password가 틀렸습니다"); return
	 * "member/sign_in"; } MemberDTO dto = service.selectOne(map);
	 * 
	 * session.setAttribute("mem_id", map.get("mem_id"));
	 * session.setAttribute("mem_no", dto.getMem_no());
	 * 
	 * return "forward:/main.aw"; }//////////signInProcess()
	 */
	@RequestMapping("/signout.aw")
	public String signOut(HttpSession session) throws Exception {
		session.invalidate();

		return "forward:/main.aw";
	}////////////// signOut()

	@RequestMapping("/member/sign_up.aw")
	public String signUp() throws Exception {

		return "member/sign_up";
	}////////////// signUp()

	@RequestMapping("/signUpProcess.aw")
	public String signUpProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		System.out.println(map.get("mem_pw"));
		map.put("mem_pw", passwordEncoder.encode(map.get("mem_pw").toString()));
		System.out.println(map.get("mem_pw"));
		int signup = service.insert(map);
		if (signup == 2)
			model.addAttribute("check", 1);
		else
			model.addAttribute("check", 0);

		return "member/sign_process";
	}////////// signUpProcess

	@RequestMapping("/profile_main.aw")
	public String profileMain(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		return "member/profile_main.tiles";
	}////////////////// profileMain

	@RequestMapping("/member_bye.aw")
	public String member_bye(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		int delete = service.delete(map);
		if (delete == 1) {
			// 회원탈퇴이전에 세션기록 없애고
			session.invalidate();
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
		}
		return "member/bye_process";
	}/////////////// member_bye

	@RequestMapping("/member_info.aw")
	public String member_info(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		MemberDTO record = new MemberDTO();
		List<AnimalDTO> anirecord = new ArrayList<AnimalDTO>();
		// 사람 조회
		record = service.selectOne(map);
		anirecord = aniservice.selectList(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		model.addAttribute("anirecord", anirecord);
		return "forward:profile_main.aw";
	}/////////////// member_info

	@RequestMapping(value = "/enrollProcess.aw", method = RequestMethod.POST)
	public String enrollProcess(MultipartHttpServletRequest mhsr, @RequestParam Map map, HttpSession session,
			Model model) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("ani_photo");
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		List<String> uploadList = AwsS3Utils.uploadFileToS3(mhsr, "animalprofile"); // S3 업로드

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("ani_name", mhsr.getParameter("ani_name").toString());
		map.put("ani_age", mhsr.getParameter("ani_age").toString());
		map.put("ani_gender", mhsr.getParameter("ani_gender").toString());
		map.put("ani_species", mhsr.getParameter("ani_species").toString());
		map.put("ani_kind", mhsr.getParameter("ani_kind").toString());
		map.put("ani_pic", AwsS3Utils.LINK_ADDRESS + uploadList.get(0));

		int enroll = aniservice.insert(map);
		if (enroll == 1)
			model.addAttribute("check", 1);
		else
			model.addAttribute("check", 0);

		return "member/enroll_process";
	}////////// enrollProcess

	// 네이버 로그인 url 반환
	@RequestMapping("/Member/Login.bbs")
	public String login(Model model, HttpSession session) throws Exception {

		return "common/member/Login.tiles";
	}

	// 안드로이드 용
	@ResponseBody
	@RequestMapping(value = "/android.aw", method = RequestMethod.POST)
	public String androidLogin(@RequestParam Map map) throws Exception {
		if (!service.isMember(map)) {
			return "false";
		}
		MemberDTO dto = service.selectOne(map);
		return dto.getMem_id();
	}//////////////// androidLogin
}//////////////////// MemberController class