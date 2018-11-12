package com.animal.aniwhere.web.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketMainController {

	@RequestMapping("/market/main.aw")
	public String market_main() throws Exception {
		return "market/MainMaket.tiles";
	}////////// market_main
	
		
		
	@RequestMapping("/market/groupbuyinside.aw")
	public String groupbuyinside() throws Exception {
		return "market/inside/groupbuyinside.tiles";
				
	}
	

	@RequestMapping("/market/GroupBuyWrite.aw")
	public String GroupBuyWrite() throws Exception {
		return "market/write/GroupBuyWrite.tiles";
			
	}
	
	@RequestMapping(value="/market/{path}")
	public String move(@PathVariable String path) throws Exception {
		return "forward:/market/"+path+"/temporarily.aw";
		
	//return "market/"+path+"/temporarily";
	
	}////////// move
	
	
	
	
}//////////////////// MarketMainController
