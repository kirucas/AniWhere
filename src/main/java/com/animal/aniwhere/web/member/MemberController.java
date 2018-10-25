package com.animal.aniwhere.web.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.aniwhere.service.impl.member.MemberServiceImpl;
import com.animal.aniwhere.service.member.MemberDTO;

@Controller
public class MemberController {

   @Resource(name="memberService")
   private MemberServiceImpl service;
   
   @RequestMapping("/login.aw")
   public String go_login() throws Exception {
      return "member/sign_in";
   }////////// go_login

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
   }////////// signInProcess
   
   @RequestMapping("/signout.aw")
   public String signOut(HttpSession session) throws Exception {
      session.invalidate();
      
      return "forward:/main.aw";
   }
   @RequestMapping("/member/sign_up.aw")
   public String signUp(){
	   
      return "member/sign_up";
   }

   @RequestMapping("/signUpProcess.aw")
   public String signUpProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {
      int signup = service.insert(map);
      if(signup==1)
    	  model.addAttribute("check",1);
      else
    	  model.addAttribute("check",0);
      
      return "member/sign_process";
   }////////// signInProcess
   
   @RequestMapping("/profile_main.aw")
   public String profileMain(@RequestParam Map map, HttpSession session, Model model) throws Exception {

      return "member/profile_main.tiles";
   }
   
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
   }
   
   @RequestMapping("/member_info.aw")
   public String member_info(@RequestParam Map map, HttpSession session, Model model) throws Exception {
	  map.put("mem_no", session.getAttribute("mem_no"));
	  MemberDTO record = new MemberDTO();
	  //사람 조회
	  record = service.selectOne(map);
	  //데이터 저장]
	  model.addAttribute("record", record);
      return "forward:profile_main.aw";
   }

   
}//////////////////// MemberController class