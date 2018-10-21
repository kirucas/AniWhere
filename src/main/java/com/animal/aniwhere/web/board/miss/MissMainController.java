package com.animal.aniwhere.web.board.miss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MissMainController {

	@RequestMapping("/miss/miss_main.aw")
	public String miss_main() throws Exception {
		return "miss/miss_main.tiles";
	}////////// miss_main
	

	@RequestMapping(value = "/miss/{path}", method = RequestMethod.GET)
	public String move_board(@PathVariable String path) throws Exception {
		return "miss/" + path + "/" + path + "_main.tiles";
	}////////// move_board/miss/find.aw

}//////////////////// MissMainController class
