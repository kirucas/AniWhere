package com.animal.aniwhere.web.market.sell;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketSellController {

	@RequestMapping("/market/{path}/sell.aw")
	public String inside(@PathVariable String path) throws Exception {
		return "market/" + path + "/inside.tiles";
	
	
	}////////// move
	
	
	
	
}//////////////////// MarketMainController
