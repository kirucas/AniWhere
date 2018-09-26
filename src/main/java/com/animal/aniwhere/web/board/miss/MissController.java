package com.animal.aniwhere.web.board.miss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MissController {

	@RequestMapping("/miss_main.aw")
	public String picture_list() throws Exception {
		return "miss/miss_main.tiles";
	}
}
