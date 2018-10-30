package com.animal.aniwhere.web.board.animal.dog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AllCommentService;

public class DogQuestCmtController {
	//서비스 주입]
	@Resource(name="allCommentService")
	private AllCommentService allCommentService;
	
	public static final String TABLE_NAME = "quest";
	
	@ResponseBody
	@RequestMapping(value="",produces="text/html; charset=UTF-8")
	public String write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
		map.put("mem_no",session.getAttribute("mem_no"));
		allCommentService.insert(map);
		return map.get("origin_no").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="",produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map) throws Exception{
		List<AllCommentDTO> comments = allCommentService.selectList(map);
		
		return JSONArray.toJSONString(comments);
	}
	
	@ResponseBody
	@RequestMapping(value="",produces="text/html; charset=UTF-8")
	public String edit(@RequestParam Map map) throws Exception{
		allCommentService.update(map);
		return map.get("origin_no").toString();
	}
	
	@ResponseBody
	@RequestMapping(value="",produces="text/html; charset=UTF-8")
	public String delete(@RequestParam Map map) throws Exception{
		allCommentService.delete(map);
		return map.get("origin_no").toString();
	}
	
}
