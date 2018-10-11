package com.animal.aniwhere.web.where;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WhereController {

	  @RequestMapping("/where/main.aw")
	   public String where_main() throws Exception {
	      return "where/whereMain.tiles";
	   }////////// mating_main
}
