package com.animal.aniwhere.web.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeboardController {

	@RequestMapping("/animal/freeboard.aw")
	public String free_main() throws Exception {
		return "board/freeboard/temporarily.tiles";
	}////////// free_main
	
}//////////////////// FreeboardController
