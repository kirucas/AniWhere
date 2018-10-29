package com.animal.aniwhere.web.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {

	@RequestMapping("/qna.aw")
	public String qnaList() throws Exception {
		return "/notice/qna.tiles";
	}/// qnaList
}/// class
