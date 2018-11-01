package com.animal.aniwhere.web.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.animal.FreeBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.FreeBoardServiceImpl;	

@Controller
public class FreeboardController {

	@Resource(name="freeService")
	private FreeBoardServiceImpl freeservice;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	
	@RequestMapping("/security/animal/freeboard.aw")
	public String free_main(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount= freeservice.getTotalRecord(map);			
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]
		List<FreeBoardDTO> list = freeservice.selectList(map);
		//페이징 문자열을 위한 로직 호출]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/animal/freeboard.aw?");
		//데이터 저장]
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "board/freeboard/freeboard_main.tiles";
		
	}////////// free_main
	
	//상세보기
	@RequestMapping("/security/animal/freeboard_view.aw")
	public String free_view(@RequestParam Map map,Model model) throws Exception {
		//서비스 호출]
		//게시글
		FreeBoardDTO record = freeservice.selectOne(map);
		//데이터 저장]
		model.addAttribute("record", record);
		//줄바꿈처리
		record.setFree_content(record.getFree_content().replace("\r\n", "<br/>"));
		//뷰정보 반환]
		return "board/freeboard/freeboard_view.tiles";
	}////////// free_main
	//등록 폼으로 이동 및 입력처리]
	@RequestMapping(value="/security/animal/freeboard/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/freeboard/freeboard_write.tiles";
	}////////////////
	//입력처리]
	@RequestMapping(value="/security/animal/freeboard/write.aw",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session //,org.springframework.security.core.Authentication auth 아직 적용 안함
		) throws Exception{
		//서비스 호출
		//작성자의 id를 DTO에 설정
		//스프링 시큐리티 적용 전
		map.put("mem_no", session.getAttribute("mem_no"));
		//System.out.println("인증된 사용자:"+auth.getPrincipal());
		//UserDetails authenticatedUser = (UserDetails) auth.getPrincipal();
		//System.out.println("아이디 : "+authenticatedUser.getUsername());
		//System.out.println("비밀번호 : "+authenticatedUser.getPassword());
		//System.out.println("권한:"+authenticatedUser.getAuthorities().toString());
		//스프링 시큐리티적용 후
		//map.put("id", authenticatedUser.getUsername());
		freeservice.insert(map);
		//뷰정보반환:목록으로 이동
		return "forward:/animal/freeboard.aw";//접두어 접미어 설정 적용 안되게끔 하려고 forward:를 붙임
	}////////////////

	//수정폼으로 이동 및 수정 처리]
	@RequestMapping("/security/animal/freeboard/edit.aw")
	public String edit(HttpServletRequest req,@RequestParam Map map,Model model) throws Exception{
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			FreeBoardDTO record = freeservice.selectOne(map);
			//수정 폼으로 이동]
			model.addAttribute("record", record);
			return "board/freeboard/freeboard_edit.tiles";
		}
		//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
		System.out.println(map.get("free_category").toString());
		int successFail = freeservice.update(map);
		model.addAttribute("successFail", successFail);
		model.addAttribute("WHERE", "EDT");
		return "board/freeboard/Message";
	}//////////////edit()
	
	//삭제 처리
	@RequestMapping("/animal/freeboard/delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		int successFail = freeservice.delete(map);
		model.addAttribute("successFail", successFail);
		return "board/freeboard/Message";
	}//////////////delete()
		
	//Summernote 업로드 기능
	@ResponseBody
    @RequestMapping(value="/animal/freeboard/Upload.aw")
    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		//File file = new File(phisicalPath+File.separator+newFilename);
		//upload.transferTo(file);
		
		List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "free"); // S3  업로드
		
        //return "/Upload/"+newFilename;
		return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
   }
}//////////////////// FreeboardController

