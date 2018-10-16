package com.animal.aniwhere.web.board.animal.dog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DogStoryController {
	
	@RequestMapping(value="/animal/dog/quest/quest_write.aw",method=RequestMethod.GET)
	public String quest_write() throws Exception {
		return "board/animal/dog/quest/quest_write.tiles";
	}
	
	@RequestMapping("/animal/dog/quest/quest_view.aw")
	public String quest_view() throws Exception{
		
		return "board/animal/dog/quest/quest_view.tiles";
	}

	@RequestMapping("/animal/dog/quest/quest_edit.aw")
	public String quest_edit() throws Exception{
		
		return "board/animal/dog/quest/quest_edit.tiles";
	}
	
}//////////////////// StoryController
