package com.animal.aniwhere.web.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
	    
   @Resource(name="naverLoginBO")
   private NaverLoginBO naverLoginBO;
	
   @Resource(name="memberService")
   private MemberServiceImpl service;
   
   @Resource(name="animalService")
   private AnimalServiceImpl aniservice;
   
   @RequestMapping("/login.aw")
   public String go_login(Model model, HttpSession session) throws Exception {
	   /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
       String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
       
       //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
       //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
       System.out.println("네이버:" + naverAuthUrl);
       //네이버 
       model.addAttribute("url", naverAuthUrl); 
	   
      return "member/sign_in";
   }//////////go_login
   
   //네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/Member/Callback.aw", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
	   
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        System.out.println("터졌니");
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);  
        System.out.println(apiResult);
//        String[] result = apiResult.split(",");
//        String email = null;
//        String name = null;
//        for(int i=0;i<result.length;i++) {
//        	if(result[i].indexOf("email") != -1) {
//        		String[] value = result[i].split(":");
//        		email = value[1];
//        	}else if(result[i].indexOf("name") != -1) {
//        		String[] value = result[i].split(":");
//        		name = value[1];
//        	}
//        }
       // System.out.println(email+" "+name);     
          
       return "redirect://";
    }
   
   @RequestMapping("/animal/enroll.aw")
   public String animal_enroll() throws Exception {
      
      return "member/animal_enroll";
   }//////////animal_enroll

   @RequestMapping(value = "/signInProcess.aw", method = RequestMethod.POST)
   public String signInProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {
      if(!service.isMember(map)) {
         model.addAttribute("sign_error", "ID 혹은 Password가 틀렸습니다");
         return "member/sign_in";
      }
      MemberDTO dto = service.selectOne(map);
      session.setAttribute("mem_id", map.get("mem_id"));
      session.setAttribute("mem_no", dto.getMem_no());
      
      return "forward:/main.aw";
   }//////////signInProcess()
   
   @RequestMapping("/signout.aw")
   public String signOut(HttpSession session) throws Exception {
      session.invalidate();
      
      return "forward:/main.aw";
   }//////////////signOut()
   
   @RequestMapping("/member/sign_up.aw")
   public String signUp() throws Exception{
      
      return "member/sign_up";
   }//////////////signUp()

   @RequestMapping("/signUpProcess.aw")
   public String signUpProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {
      int signup = service.insert(map);
      if(signup==1)
    	  model.addAttribute("check",1);
      else
    	  model.addAttribute("check",0);
      
      return "member/sign_process";
   }//////////signInProcess
   
   @RequestMapping("/profile_main.aw")
   public String profileMain(@RequestParam Map map, HttpSession session, Model model) throws Exception {

      return "member/profile_main.tiles";
   }//////////////////profileMain
   
   @RequestMapping("/member_bye.aw")
   public String member_bye(@RequestParam Map map, HttpSession session, Model model) throws Exception {
	  map.put("mem_no", session.getAttribute("mem_no"));
	  int delete = service.delete(map);
      if(delete==1) {
    	  //회원탈퇴이전에 세션기록 없애고
    	  session.invalidate(); 
    	  model.addAttribute("check",1);
      }
      else {
    	  model.addAttribute("check",0);
      }
      return "member/bye_process";
   }///////////////member_bye
   
   @RequestMapping("/member_info.aw")
   public String member_info(@RequestParam Map map, HttpSession session, Model model) throws Exception {
	  map.put("mem_no", session.getAttribute("mem_no"));
	  MemberDTO record = new MemberDTO();
	  List<AnimalDTO> anirecord = new ArrayList<AnimalDTO>();
	  //사람 조회
	  record = service.selectOne(map);
	  anirecord = aniservice.selectList(map);
	  //데이터 저장]
	  model.addAttribute("record", record);
	  model.addAttribute("anirecord", anirecord);
      return "forward:profile_main.aw";
   }///////////////member_info

   @RequestMapping(value="/enrollProcess.aw", method = RequestMethod.POST)
   public String enrollProcess(MultipartHttpServletRequest mhsr,@RequestParam Map map, HttpSession session, Model model) throws Exception {
	  String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
	  MultipartFile upload = mhsr.getFile("ani_photo");
	  String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
	  List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "animalprofile"); // S3  업로드
	  
	  map.put("mem_no", session.getAttribute("mem_no"));
	  map.put("ani_name", mhsr.getParameter("ani_name").toString());
	  map.put("ani_age", mhsr.getParameter("ani_age").toString());
	  map.put("ani_gender", mhsr.getParameter("ani_gender").toString());
	  map.put("ani_species", mhsr.getParameter("ani_species").toString());
	  map.put("ani_kind", mhsr.getParameter("ani_kind").toString());
	  map.put("ani_pic", AwsS3Utils.LINK_ADDRESS+uploadList.get(0)); 

      int enroll = aniservice.insert(map);
      if(enroll==1)
    	  model.addAttribute("check",1);
      else
    	  model.addAttribute("check",0);
      
      return "member/enroll_process";
   }//////////signInProcess
   
   //네이버 로그인 url 반환
  	@RequestMapping("/Member/Login.bbs")
  	public String login(Model model, HttpSession session) throws Exception{
  		
  		return "common/member/Login.tiles";
  	}
   
   
   
   
   
   
   	//안드로이드 용
 	@ResponseBody
 	@RequestMapping(value="/android.aw", method = RequestMethod.POST)
 	public String androidLogin(@RequestParam Map map) throws Exception{
 		if(!service.isMember(map)) {
 			return "false";
 		}		
 		MemberDTO dto = service.selectOne(map);				
 		return dto.getMem_id();
    }////////////////androidLogin
 	
}//////////////////// MemberController class