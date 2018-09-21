package com.animal.aniwhere.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/login.aw")
	public String go_login() throws Exception {
		return "";
	}
	
}
