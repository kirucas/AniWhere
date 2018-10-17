package com.animal.aniwhere.web.board.animal.dog;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.AllCommentService;
import com.animal.aniwhere.service.animal.QuestBoardDTO;
import com.animal.aniwhere.service.impl.animal.QuestBoardServiceImpl;

@Controller
public class DogStoryController {
	
	@Resource(name="questService")
	private QuestBoardServiceImpl questService;
	@Resource(name="commentService")
	private AllCommentService commentService;
	
	@RequestMapping("/animal/dog/quest/quest_list.aw")
	public String quest_list(@RequestParam Map map,Model model) throws Exception{
		List<QuestBoardDTO> list = questService.selectList(map);
		return "board/animal/dog/quest/quest_list.tiles";
	}
	
	@RequestMapping(value="/animal/dog/quest/quest_write.aw",method=RequestMethod.GET)
	public String quest_write() throws Exception {
		return "board/animal/dog/quest/quest_write.tiles";
	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public String quest_writeOk(@RequestParam Map map,HttpSession session) throws Exception{
		map.put("", "");
		return "";
	}
	
	@RequestMapping("/animal/dog/quest/quest_view.aw")
	public String quest_view(@RequestParam Map map,Model model) throws Exception{
		QuestBoardDTO record = questService.selectOne(map);
		record.setQuest_content(record.getQuest_content().replace("\r\n","<br/>"));
		model.addAttribute("record",record);
		return "board/animal/dog/quest/quest_view.tiles";
	}

	@RequestMapping("/animal/dog/quest/quest_edit.aw")
	public String quest_edit(Model model,@RequestParam Map map,HttpServletRequest req) throws Exception{
		
		return "board/animal/dog/quest/quest_edit.tiles";
	}
	
	
	
}//////////////////// StoryController
