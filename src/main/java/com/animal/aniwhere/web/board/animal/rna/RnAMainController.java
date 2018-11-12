package com.animal.aniwhere.web.board.animal.rna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RnAMainController {

	@RequestMapping("/animal/rNa/main.aw")
	public String rna_main() throws Exception {
		return "board/animal/rNa/rNa_main.tiles";
	}////////// rna_main

	@RequestMapping(value = "/animal/rNa/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/rNa/" + path + "/" + path + "_list.tiles";
	}////////// move_board
	
}//////////////////// RnAMainController class
