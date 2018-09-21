package com.animal.aniwhere.web.mating;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatingController {
	
	@RequestMapping("/mating.aw")
	public String mating_main() throws Exception {
		return "mating/matingMain.tiles";
	}////////// mating_main
	
	@RequestMapping("/matingProfile.aw")
	public String mating_profile() throws Exception {
		return "mating/matingProfile.tiles";
	}////////// mating_profile
	
}//////////////////// MatingController class

