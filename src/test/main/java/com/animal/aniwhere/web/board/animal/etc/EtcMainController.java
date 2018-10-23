package com.animal.aniwhere.web.board.animal.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcMainController {

	@RequestMapping("/animal/etc/main.aw")
	public String etc_main() throws Exception {
		return "board/animal/etc/etc_main.tiles";
	}////////// etc_main
	
	@RequestMapping(value = "/animal/etc/{path}", method = RequestMethod.GET)
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/etc/" + path + "/" + path + "_list.tiles";
	}////////// move_board
	
}//////////////////// EctMainController class
