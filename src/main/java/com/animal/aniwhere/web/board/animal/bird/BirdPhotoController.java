package com.animal.aniwhere.web.board.animal.bird;

import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BirdPhotoController {
	//등록 폼으로 이동]
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/bird/photo/photo_write.tiles";
	}/////////////////////////// write
	
	// 등록 완료 후 리스트로 이동
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.POST)
	public String writeComplete(@RequestParam Map map) throws Exception{
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("value:"+map.get(key));
		
		return "forward:/animal/bird/photo.aw";
	}/////////////////////////// write
	
}//////////////////// PhotoController class