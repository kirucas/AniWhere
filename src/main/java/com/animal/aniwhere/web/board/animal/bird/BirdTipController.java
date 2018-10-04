package com.animal.aniwhere.web.board.animal.bird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BirdTipController {

	@RequestMapping("/animal/bird/tip.aw")
	public String bird_tip_list() throws Exception {
		return "board/animal/bird/tip/tip_list.tiles";
	}////////// free_main
	
	
}//////////////////// TipController class
