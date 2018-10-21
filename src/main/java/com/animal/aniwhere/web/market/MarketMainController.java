package com.animal.aniwhere.web.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketMainController {

	@RequestMapping("/market/main.aw")
	public String market_main() throws Exception {
		return "market/temporarily.tiles";
	}////////// market_main
	
	@RequestMapping("/market/{path}")
	public String move(@PathVariable String path) throws Exception {
		return "market/" + path + "/temporarily.tiles";
	}////////// move
	
}//////////////////// MarketMainController
