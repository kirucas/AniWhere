package com.animal.aniwhere.web.board.animal.bird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BirdMovieController {
	@RequestMapping("/animal/bird/movie/write.aw")
	   public String movie_write() throws Exception {
	      return "board/animal/bird/movie/movieInsert_form.tiles";
	   }
}//////////////////// MovieController class