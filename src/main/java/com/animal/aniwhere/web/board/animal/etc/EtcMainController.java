package com.animal.aniwhere.web.board.animal.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcMainController {

	@RequestMapping("/animal/etc/main.aw")
	public String etc_main() throws Exception {
		return "board/animal/etc/etc_main.tiles";
	}////////// etc_main
	
	@RequestMapping(value = "/animal/etc/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/etc/" + path + "/" + path + "_list.tiles";
	}////////// move_board
	
}//////////////////// EctMainController class
