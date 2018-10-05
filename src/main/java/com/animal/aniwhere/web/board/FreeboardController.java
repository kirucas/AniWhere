package com.animal.aniwhere.web.board;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FreeboardController {

	@RequestMapping("/animal/freeboard.aw")
	public String free_main() throws Exception {
		return "board/freeboard/freeboard_main.tiles";
	}////////// free_main
	
	@RequestMapping("/animal/freeboard/write.aw")
	public String free_write() throws Exception{
		return "board/freeboard/freeboard_write.tiles";
	}////////// free_write
	
/*	@ResponseBody
	@RequestMapping(value="/ReplyBBS/BBS/Upload.bbs",produces="text/plain; charset=UTF-8")
	public String upload(MultipartHttpServletRequest mhsr) throws Exception{
		//1]서버의 물리적 경로 얻기
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		//2] File 객체 생성
	    //2-1]파일 중복시 이름 변경
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFilename);
	    //3] 업로드 처리
	    upload.transferTo(file);
		return "/Upload/"+newFilename;
	}*/
}//////////////////// FreeboardController
