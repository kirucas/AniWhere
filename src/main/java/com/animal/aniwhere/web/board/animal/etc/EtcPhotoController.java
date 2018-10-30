package com.animal.aniwhere.web.board.animal.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcPhotoController {
	
	@RequestMapping("/etc/photo/write.aw")
	public String photo_write() throws Exception {
		return "board/animal/etc/photo/photo_write.tiles";
	}/// photo_write
	
}//////////////////// PhotoController class
