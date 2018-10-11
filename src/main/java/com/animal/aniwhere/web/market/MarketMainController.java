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
	
	@RequestMapping(value="/market/{path}")
	public String move(@PathVariable String path) throws Exception {
		return "market/" + path + "/temporarily.tiles";
	
	
	}////////// move
	
	/*
	@RequestMapping("/market/insidebuy.aw")
	public String move1(@PathVariable String path) throws Exception {
		return "market/buy/insidebuy.tiles";
	
	
	}////////// move
	*/
	/*
	@RequestMapping("/market/buy")
	public String move1(@PathVariable String path) throws Exception {
		return "market/buy/temporarily.tiles";
	
	
	}////////// move
	
	@RequestMapping("/market/sell.aw")
	public String move2(@PathVariable String path) throws Exception {
		return "market/sell/temporarily.tiles";
	
	
	}////////// move
	
	@RequestMapping("/market/groupbuy.aw")
	public String move3(@PathVariable String path) throws Exception {
		return "market/groupbuy/temporarily.tiles";
	
	
	}////////// move*/
	
	
}//////////////////// MarketMainController
