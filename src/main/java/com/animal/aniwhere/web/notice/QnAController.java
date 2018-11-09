package com.animal.aniwhere.web.notice;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QnAController {
	@RequestMapping("/qna.aw")
	   public String qnaList() throws Exception {
		   
	      return "/notice/qna.tiles";
	   }/// qnaList
	   @RequestMapping("/notice/View.aw")
	   public String qnaView(@RequestParam Map<String, Object> paramMap, Model model) throws Exception{
		 
		   return "/notice/qnaView.tiles";
	   }
	   @RequestMapping("/notice/Write.aw")
	   public String qnaWrite(Model model) throws Exception{
		   return "/notice/qnaWrite.tiles";
	   }
	   @RequestMapping("/notice/Edit.aw")
	   public String qnaEdit(Model model) throws Exception{
		   
		   return "notice/qnaEdit.tiles";
	   }
	}/// class




