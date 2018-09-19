package com.animal.aniwhere.web.board.animal.bird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PictureController {

	@RequestMapping("/bird_list.aw")
	public String picture_list() throws Exception {
		return "board/animal/bird/picture/picture_list.tiles";
	}
	
}
