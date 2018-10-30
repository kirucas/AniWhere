package com.animal.aniwhere.web.board.animal.bird;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;

@Controller
public class BirdPhotoController {
	//등록 폼으로 이동]
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/bird/photo/photo_write.tiles";
	}/// write
	
	// 등록 완료 후 리스트로 이동
	@ResponseBody
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.POST)
	public void writeComplete(@RequestParam Map map,MultipartHttpServletRequest mhsr) throws Exception{
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("key:"+key+", value:"+map.get(key));
		
		// 이 메소드만 부르면 될것	
		List<String> upFiles=AwsS3Utils.uploadFileToS3(mhsr,"bird");
		for(String name:upFiles)
			System.out.println(name);
	}/// writeComplete

}//////////////////// PhotoController class