package com.animal.aniwhere.web.board.animal.dog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AllCommentService;

@Controller
public class QueCmtController {

	@Resource(name="allCommentService")
	private AllCommentService allCommentService;
	
	@ResponseBody
	@RequestMapping(value="/dog/quest/cmtWrite.aw",produces="text/html; charset=UTF-8")
	public String write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
		map.put("mem_no",session.getAttribute("mem_no"));
		allCommentService.insert(map);
		return map.get("no").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/dog/quest/cmtList.aw",produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map) throws Exception{
		List<AllCommentDTO> comment = allCommentService.selectList(map);
		return "";
	}
}
