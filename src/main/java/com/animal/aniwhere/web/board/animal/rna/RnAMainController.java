package com.animal.aniwhere.web.board.animal.rna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RnAMainController {

	@RequestMapping("/animal/rna/main.aw")
	public String rna_main() throws Exception {
		return "board/animal/rNa/rNa_temporarily.tiles";
	}////////// rna_main

	@RequestMapping(value = "/animal/rna/{path}", method = RequestMethod.GET)
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/rNa/" + path + "/" + path + "_list.tiles";
	}////////// move_board
	
}//////////////////// RnAMainController class
