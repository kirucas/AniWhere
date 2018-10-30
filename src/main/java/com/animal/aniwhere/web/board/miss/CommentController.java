package com.animal.aniwhere.web.board.miss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.impl.AllCommentServiceImpl;

@Controller
public class CommentController {

	//서비스 주입
	@Resource(name="allCommentService")
	private AllCommentServiceImpl commentService;
	
	@ResponseBody
	@RequestMapping(value="/Comment/Write.aw",produces="text/html; charset=UTF-8")
	public String write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
		
		map.put("table_name", "see");
		
		map.put("no", session.getAttribute("origin_no"));

		commentService.insert(map);
		
		return map.get("no").toString();
	}///////////////////
	
	@ResponseBody
	@RequestMapping(value="/Comment/List.aw",produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map) throws Exception{
		
		System.out.println("!1212123124qw");
		
		map.put("table_name", "see");
		
		List<AllCommentDTO> comments = commentService.selectList(map);
		
		return JSONArray.toJSONString(comments);
	}//////////////////
	
	@ResponseBody
	@RequestMapping(value="/Comment/Edit.awa",produces="text/html; charset=UTF-8")
	public String update(@RequestParam Map map) throws Exception{
		
		commentService.update(map);
		
		return map.get("no").toString();
	}////////////
	
	@ResponseBody
	@RequestMapping(value="/Comment/Delete.awa",produces="text/html; charset=UTF-8")
	public String delete(@RequestParam Map map) throws Exception{
		
		commentService.delete(map);
		
		return map.get("no").toString();
	}
	
	
}////////////////////////////////////////////////////////////
