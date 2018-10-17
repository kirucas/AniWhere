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
	
	@RequestMapping("/market/buyinside.aw")
	public String buyinside() throws Exception {
		return "market/inside/buyinside.tiles";
		
		
	}
	@RequestMapping("/market/sellinside.aw")
	public String sellinside() throws Exception {
		return "market/inside/sellinside.tiles";
		
		
	}
	
	
	
	@RequestMapping("/market/groupbuyinside.aw")
	public String groupbuyinside() throws Exception {
		return "market/inside/groupbuyinside.tiles";
		
		
	}
	
	@RequestMapping("/market/buyWrite.aw")
	public String buyWrite() throws Exception {
		return "market/write/buyWrite.tiles";
		
		
	}
	
	@RequestMapping("/market/SellWrite.aw")
	public String SellWrite() throws Exception {
		return "market/write/SellWrite.tiles";
		
		
	}
	@RequestMapping("/market/GroupBuyWrite.aw")
	public String GroupBuyWrite() throws Exception {
		return "market/write/GroupBuyWrite.tiles";
			
	}
	
	
	@RequestMapping(value="/market/{path}")
	public String move(@PathVariable String path) throws Exception {
		return "market/" + path + "/temporarily.tiles";
	
	
	}////////// move
	
	
	
	
}//////////////////// MarketMainController
