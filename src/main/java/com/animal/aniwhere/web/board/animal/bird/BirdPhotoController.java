package com.animal.aniwhere.web.board.animal.bird;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.web.board.FileUpDownUtils;

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
	public String writeComplete(@RequestParam Map map,MultipartHttpServletRequest mhsr) throws Exception{
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("value:"+map.get(key));
		
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("files");
		
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFilename);
		upload.transferTo(file);
		
		System.out.println("업로드으!");
        return "/Upload/"+newFilename;
	}/// writeComplete
	
}//////////////////// PhotoController class