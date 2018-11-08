package com.animal.aniwhere.web.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.net.QCodec;
import org.json.simple.JSONArray;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.QRCode_Generator;
import com.animal.aniwhere.service.ReservationDTO;
import com.animal.aniwhere.service.impl.ReservationServiceImpl;
import com.animal.aniwhere.service.impl.member.AndroidTokenServiceImpl;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;
import com.animal.aniwhere.service.impl.member.MemberServiceImpl;
import com.animal.aniwhere.service.member.AnimalDTO;
import com.animal.aniwhere.service.member.MemberDTO;
import com.animal.aniwhere.service.member.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Sender;
import com.google.zxing.qrcode.encoder.QRCode;

@Controller
public class MemberController {
	private String apiResult = null;

	@Resource(name = "naverLoginBO")
	private NaverLoginBO naverLoginBO;

	@Resource(name = "memberService")
	private MemberServiceImpl service;

	@Resource(name = "animalService")
	private AnimalServiceImpl aniservice;

	@Resource(name = "tokenService")
	private AndroidTokenServiceImpl androidservice;
	
	@Resource(name = "reservationService")
	private ReservationServiceImpl reservationservice;

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
		map.put("mem_pw",  passwordEncoder.encode("naver"));
		map.put("mem_nickname", jsonResult.get("nickname").toString());
		map.put("mem_gender", "U");
		map.put("mem_name", jsonResult.get("name").toString());
		map.put("mem_log", 1);
		map.put("mem_interani", "0");
		MemberDTO dto = service.selectOne(map);
		// 네이버로 로그인 한적이 없으면 일로 드감.
		if (dto == null) {
			int signup = service.insert(map);
			dto = service.selectOne(map);
			if (signup == 2)
				session.setAttribute("check", 2);
			else
				session.setAttribute("check", 0);
		}
		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_pw", "naver");
		return "member/socialLogin";
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
		map.put("mem_pw",  passwordEncoder.encode("google"));
		map.put("mem_nickname", System.nanoTime());
		map.put("mem_gender", "U");
		map.put("mem_name", profile.getDisplayName());
		map.put("mem_log", 2); // 구글 로그인 연동
		map.put("mem_interani", "0");
		MemberDTO dto = service.selectOne(map);
		// 구글로 로그인 한적이 없으면 일로 드감.
		if (dto == null) {
			int signup = service.insert(map);
			dto = service.selectOne(map);
			if (signup == 2)
				session.setAttribute("check", 3);
			else
				session.setAttribute("check", 0);
		}
		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_pw", "google");
		return "member/socialLogin";
	}////////////// googleCallback

	@RequestMapping("/animal/enroll.aw")
	public String animal_enroll() throws Exception {

		return "member/animal_enroll";
	}////////// animal_enroll

	@RequestMapping("/animal/enroll_edit.aw")
	public String animal_enroll_edit(@RequestParam Map map, Model model) throws Exception {

		map.put("ani_no", map.get("ani_no"));
		AnimalDTO record = aniservice.selectOne(map);
		model.addAttribute("record", record);
		return "member/animal_enroll_edit";
	}
	
	@RequestMapping("/member/edit.aw")
	public String member_edit(@RequestParam Map map,@RequestParam List<String> mem_interani, Model model,HttpSession session,HttpServletRequest request) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		String inter="";
		for(String ani : mem_interani)
			inter+=ani;
		map.put("mem_interani", inter);
		int update = service.update(map);
		if(update==1)
			model.addAttribute("edit",1);
		else
			model.addAttribute("edit",0);
		return "member/edit_process";
	}

	@RequestMapping("/signIn/security.aw")
	public String security(@RequestParam Map map,Authentication auth, HttpSession session) throws Exception {
		//System.out.println("인증된 사용자:" + auth.getPrincipal());
		UserDetails authenticatedUser = ((UserDetails) auth.getPrincipal());
		//System.out.println(authenticatedUser.getUsername());
		//System.out.println(authenticatedUser.getAuthorities().toString());
		map.put("mem_id", authenticatedUser.getUsername());
		MemberDTO dto = service.selectOne(map);
		session.setAttribute("mem_id", map.get("mem_id"));
		session.setAttribute("mem_no", dto.getMem_no());
	
		return "redirect:/";

	}/// security
	
	// 소셜 로그인에 대한 로그인 처리
	@RequestMapping("/signInProcess.aw")
	public String signInProcess(HttpSession session,Map map) throws Exception {
		map.put("mem_id", session.getAttribute("mem_id"));
		System.out.println("map.get(\"mem_id\"):"+map.get("mem_id"));
		session.setAttribute("mem_no", service.selectOne(map).getMem_no());
		return "redirect:/";
	}////////// animal_enroll
	

	@RequestMapping("/signIn/securityMessage.aw")
	public String securityMessage(@RequestParam Map map,Model model) throws Exception {
		//System.out.println(map.get("error"));
		model.addAttribute("error",map.get("error"));
		return "member/securityMessage";
	}/// securityMessage
	@RequestMapping("/signout.aw")
	public String signOut(HttpSession session) throws Exception {
		session.invalidate();
		return "forward:/main.aw";
	}////////////// signOut()

	@RequestMapping("/member/sign_up.aw")
	public String signUp() throws Exception {
		return "member/sign_up";
	}////////////// signUp()
	
    @ResponseBody
	@RequestMapping(value="/member/nickchk.aw",method=RequestMethod.POST)
    public String idcheck(@RequestParam Map map) {
        int result = service.getTotalRecord(map);
        Map resu = new HashMap<>();
        resu.put("result", result);
        return JSONObject.toJSONString(resu);
    }/////////////idcheck
    
    @ResponseBody
	@RequestMapping(value="/member/idchk.aw", method = RequestMethod.POST)
	public String member_idchk(@RequestParam Map map) throws Exception {
		int result = service.getTotalRecord(map);
		Map resu = new HashMap<>();
        resu.put("result", result);
        return JSONObject.toJSONString(resu);
	}
	
	@RequestMapping("/signUpProcess.aw")
	public String signUpProcess(@RequestParam Map map,@RequestParam List<String> mem_interani, HttpSession session, Model model) throws Exception {
		System.out.println(map.get("mem_pw"));
		map.put("mem_pw", passwordEncoder.encode(map.get("mem_pw").toString()));
		System.out.println(map.get("mem_pw"));
		String inter="";
		for(String ani : mem_interani)
			inter+=ani;
		map.put("mem_interani", inter);
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
		// 동물 조회
		anirecord = aniservice.selectList(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		model.addAttribute("anirecord", anirecord);
		return "forward:profile_main.aw";
	}/////////////// member_info

	@RequestMapping(value = "/enrollProcess.aw", method = RequestMethod.POST)
	public String enrollProcess(MultipartHttpServletRequest mhsr, @RequestParam Map map, HttpSession session,
			Model model) throws Exception {
		// String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		// MultipartFile upload = mhsr.getFile("ani_photo");
		// String newFilename = FileUpDownUtils.getNewFileName(phisicalPath,
		// upload.getOriginalFilename());
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

	@ResponseBody
	@RequestMapping(value="/security/member/animal/delete.awa", method= RequestMethod.POST)
	public void delete_ani(@RequestParam Map map, HttpSession session,
			Model model) throws Exception {
		map.put("ani_no",map.get("ani_no"));
		int delete = aniservice.delete(map);
		List<AnimalDTO> list = aniservice.selectList(map);
		model.addAttribute("anirecord",list);
	}////////// enrollProcess

	// 안드로이드 용
	@ResponseBody
	@RequestMapping(value = "/android.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidLogin(@RequestParam Map map, HttpSession session) throws Exception {

		MemberDTO dto = service.selectOne(map);
		boolean flag = passwordEncoder.matches(map.get("mem_pw").toString(), dto.getMem_pw());
		if (!flag) {
			return "false";
		}

		return dto.getMem_id() + "," + dto.getMem_no();
	}

	// 안드로이드 googleLogin
	@ResponseBody
	@RequestMapping(value = "/androidsignUpProcess.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidSignUp(@RequestParam Map map) throws Exception {

		MemberDTO dto = service.selectOne(map);
		if (dto != null) {
			return dto.getMem_id() + "," + dto.getMem_no();
		}

		map.put("mem_log", Integer.parseInt(map.get("mem_log").toString()));
		map.put("mem_pw",passwordEncoder.encode("google"));
		int signup = service.insert(map);

		if (signup == 2) {
			dto = service.selectOne(map);
			return dto.getMem_id() + "," + dto.getMem_no();
		} else {
			return "false";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/androidMember.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidMember(@RequestParam Map map) throws Exception {
		MemberDTO dto = service.selectOne(map);
		JSONObject json = new JSONObject();
		json.put("mem_id", dto.getMem_id());
		json.put("mem_name", dto.getMem_name());
		json.put("mem_nickname", dto.getMem_nickname());
		json.put("mem_interani", dto.getMem_interani());
		json.put("mem_gender", dto.getMem_gender());
		json.put("mem_pw", dto.getMem_pw());
		return json.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/androidUpdate.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidUpDate(@RequestParam Map map) throws Exception {

		int affect = service.update(map);
		if (affect == 0) {
			return "false";
		}
		return "true";
	}

	@ResponseBody
	@RequestMapping(value = "/FireBasePushAsyncTask.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String FireBasePushAsyncTask(@RequestParam Map map) throws Exception {
		Map result = androidservice.selectOne(map);
		if (!result.get("MTK_TOKEN").equals("null")) {
			System.out.println("FireBasePushAsyncTask");

			String API_KEY = "AAAAHkvJ_3Y:APA91bG8v0lVhWawMh5bzuUjornLGLrJhlI6SQ1CkjOC82chQHKT2sC79WmlA-eZka6Gwe6sru3GegbZmwK1zv_M_ig9Qv3dgzLf4HrL_XJj42jhY5hhnI-eFB0dE_nkqdZCPmWmDJ5o";
			String gcmURL = "https://fcm.googleapis.com/fcm/send";
					
			Sender sender = new Sender(API_KEY);
	        Message msg = new Message.Builder() 
	        		.addData("message","서비스 확인되였습니다")//데이타 메시지
	                .addData("title","알림서비스")//데이타 타이틀       
	                .build();
	        //토큰 저장용
	        ArrayList<String> token = new ArrayList<String>(); 
	        token.add(result.get("MTK_TOKEN").toString());
	        try {
		        MulticastResult multicast = sender.send(msg,token,3);
		        if(multicast != null) {
		        	System.out.println("=======================1");
		        	System.out.println(map.get("visit_time").toString());
		        	QRCode_Generator.changeQRLink(reservationservice, map);
		        	System.out.println("=======================2");
		        	return "true";
		        }
	        }catch(Exception e) {
	        	System.out.println(e.getMessage());
	        	return "err";
	        }
	        
		}
		return "false";
	}

	@ResponseBody
	@RequestMapping(value = "/fireBaseInsertToken.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String fireBaseInsertToken(@RequestParam Map map) throws Exception {
		System.out.println("=======fireBaseInsertToken=======");
		Object obj = map.get("mtk_token");
		System.out.println("obj=" + obj.toString());
		System.out.println(map.get("mem_no"));

		if (!obj.equals("null")) {
			Map result = androidservice.selectOne(map);
			if (result == null) {
				androidservice.insert(map);
				System.out.println("========1=======");
			} else {
				int affect = androidservice.delete(map);
				System.out.println("========2=======");
				System.out.println(affect);
				if (affect == 1) {
					androidservice.insert(map);
					System.out.println("========3=======");
				}
			}
		}

		return "입력성공";
	}
	@ResponseBody
	@RequestMapping(value = "/androidMyAnimal.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidMyAnimal(@RequestParam Map map, HttpSession session, Model model) throws Exception {
	
		List<AnimalDTO> lists =  aniservice.selectList(map);
		List<Map> collections = new Vector<Map>();
		for (AnimalDTO list : lists) {
			Map record = new HashMap();
			record.put("ani_no", list.getAni_no());
			record.put("mem_no", list.getMem_no());
			record.put("ani_name", list.getAni_name());
			record.put("ani_age", list.getAni_age());
			record.put("ani_gender", list.getAni_age());
			record.put("ani_species", list.getAni_species());
			record.put("mem_name", list.getMem_name());
			record.put("ani_kind", list.getAni_kind());
			record.put("ani_pic", list.getAni_pic());
			record.put("mem_name", list.getMem_name());
			record.put("mem_nickname", list.getMem_nickname());
			collections.add(record);
		}
		System.out.println("myanimal=============");
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value = "/androidInMyAnimal.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidInMyAnimal(@RequestParam Map map) throws Exception {
		System.out.println("androidInsertMyAnimal");
		int affect = aniservice.insert(map);		
		System.out.println(affect);
		return "true";
	}
	
}//////////////////// MemberController class