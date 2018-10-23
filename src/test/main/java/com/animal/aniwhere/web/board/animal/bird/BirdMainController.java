package com.animal.aniwhere.web.board.animal.bird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BirdMainController {

	@RequestMapping("/animal/bird/main.aw")
	public String bird_main() throws Exception {
		return "board/animal/bird/bird_main.tiles";
	}////////// bird_main

	@RequestMapping(value = "/animal/bird/{path}", method = RequestMethod.GET)
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/bird/" + path + "/" + path + "_list.tiles";
	}////////// move_board

}//////////////////// BirdMainController class
