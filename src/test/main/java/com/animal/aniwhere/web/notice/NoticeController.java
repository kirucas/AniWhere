package com.animal.aniwhere.web.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("/notice.aw")
	public String notice() throws Exception {
		return "/notice/notice.tiles";
	}
	
}
