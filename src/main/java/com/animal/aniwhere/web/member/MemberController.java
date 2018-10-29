package com.animal.aniwhere.web.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.impl.member.MemberServiceImpl;
import com.animal.aniwhere.service.member.MemberDTO;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberServiceImpl service;

	@RequestMapping("/login.aw")
	public String go_login() throws Exception {
		return "member/sign_in";
	}////////// go_login

	@RequestMapping(value = "/signInProcess.aw", method = RequestMethod.POST)
	public String signInProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		if (!service.isMember(map)) {
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
	}////////// signOut

	@RequestMapping("/member/sign_up.aw")
	public String signUp() throws Exception {

		return "member/sign_up";

	}////////// signUp

	@RequestMapping("/signUpProcess.aw")
	public String signUpProcess(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		int signup = service.insert(map);
		if (signup == 1)
			model.addAttribute("check", true);
		else
			model.addAttribute("check", false);
		return "/login.aw";

	}////////// signUpProcess

	// 안드로이드 용
	@ResponseBody
	@RequestMapping(value = "/android.aw", method = RequestMethod.POST)
	public String androidLogin(@RequestParam Map map) throws Exception {
		if (!service.isMember(map)) {
			return "false";
		}
		MemberDTO dto = service.selectOne(map);
		return dto.getMem_id();

	}////////// androidLogin

}//////////////////// MemberController class