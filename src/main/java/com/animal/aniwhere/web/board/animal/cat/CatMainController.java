package com.animal.aniwhere.web.board.animal.cat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CatMainController {

	@RequestMapping("/animal/cat/main.aw")
	public String cat_main() throws Exception {
		return "board/animal/cat/cat_main.tiles";
	}////////// cat_main
	
	@RequestMapping(value="/animal/cat/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/cat/"+ path + "/" + path + "_list.tiles";
	}////////// move_board
	
}//////////////////// CatMainController class
