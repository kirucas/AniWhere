package com.animal.aniwhere.web.board.animal.dog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DogMainController {

	@RequestMapping("/animal/dog/main.aw")
	public String dog_main() throws Exception {
		return "board/animal/dog/dog_main.tiles";
	}////////// dog_main

	@RequestMapping(value = "/animal/dog/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "board/animal/dog/" + path + "/" + path + "_list.tiles";
	}////////// move_board
	
	
	
}//////////////////// DogMainController class
