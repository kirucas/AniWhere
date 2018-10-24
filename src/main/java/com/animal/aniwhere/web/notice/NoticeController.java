package com.animal.aniwhere.web.notice;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.animal.aniwhere.service.impl.NoticeServiceImpl;

@Controller
public class NoticeController {

	@Resource(name="noticeService")
	private NoticeServiceImpl service;
	
	@RequestMapping("/notice.aw")
	public String notice() throws Exception {
		return "/notice/notice.tiles";
	}
	
}
