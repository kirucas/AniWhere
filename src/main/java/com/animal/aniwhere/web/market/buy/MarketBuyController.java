package com.animal.aniwhere.web.market.buy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketBuyController {


	@RequestMapping("/market/insidebuy.aw")
	public String insidebuy(@PathVariable String path) throws Exception {
		return "market/buy/insidebuy.tiles";
		
		
	
	}////////// move
	
	
	
}//////////////////// MarketMainController
