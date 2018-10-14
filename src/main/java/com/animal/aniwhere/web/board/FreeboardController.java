package com.animal.aniwhere.web.board;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;	

@Controller
public class FreeboardController {

	@RequestMapping("/animal/freeboard.aw")
	public String free_main() throws Exception {
		return "board/freeboard/freeboard_main.tiles";
	}////////// free_main
	
	@RequestMapping("/animal/freeboard_view.aw")
	public String free_view() throws Exception {
		return "board/freeboard/freeboard_view.tiles";
	}////////// free_main
	
	//등록 폼으로 이동 및 입력처리]
	@RequestMapping(value="/animal/freeboard/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/freeboard/freeboard_write.tiles";
	}////////////////
	//입력처리]
	@RequestMapping(value="/animal/freeboard/write.aw",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session //,org.springframework.security.core.Authentication auth 아직 적용 안함
		) throws Exception{
		//서비스 호출
		//작성자의 id를 DTO에 설정
		//스프링 시큐리티 적용 전
		//map.put("id", session.getAttribute("id"));
		/*System.out.println("인증된 사용자:"+auth.getPrincipal());
		UserDetails authenticatedUser = (UserDetails) auth.getPrincipal();
		System.out.println("아이디 : "+authenticatedUser.getUsername());
		System.out.println("비밀번호 : "+authenticatedUser.getPassword());
		System.out.println("권한:"+authenticatedUser.getAuthorities().toString());
		//스프링 시큐리티적용 후
		map.put("id", authenticatedUser.getUsername());
		memoService.insert(map);
	*/	//뷰정보반환:목록으로 이동
		return "forward:/animal/freeboard.aw";//접두어 접미어 설정 적용 안되게끔 하려고 forward:를 붙임
	}////////////////

	@ResponseBody
    @RequestMapping(value="/animal/freeboard/Upload.aw")
    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFilename);
		upload.transferTo(file);
        return "/Upload/"+newFilename;
   }
	
}//////////////////// FreeboardController

