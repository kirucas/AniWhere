package com.animal.aniwhere.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.animal.FreeBoardDTO;
import com.animal.aniwhere.service.impl.AllCommentServiceImpl;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.FreeBoardServiceImpl;	

@Controller
public class FreeboardController {

	//service 주입
	@Resource(name="freeService")
	private FreeBoardServiceImpl freeservice;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;

	//자유게시판 메인
	@RequestMapping("/animal/freeboard.aw")
	public String free_main(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		
		map.put("table_name","freeboard");
		
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
		
		List<Map> collect = new Vector<>();
		
		for(FreeBoardDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name","freeboard");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtService.commentCount(temp));
			
			collect.add(record);
		}	
		
		//페이징 문자열을 위한 로직 호출]
		if(map.get("searchWord") != null) {
			String searchWord = map.get("searchWord").toString();	
			String searchColumn = map.get("searchColumn").toString();	

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
			
			model.addAttribute("pagingString", pagingString);
		}
		
		else {
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?");
			model.addAttribute("pagingString", pagingString);
		}
		
		//데이터 저장]
		model.addAttribute("list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "board/freeboard/freeboard_main.tiles";
		
	}// free_main
	
	@RequestMapping("/animal/freeboard_count.aw")
	public String free_main_count(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		
		map.put("table_name","freeboard");
		map.put("count", "test");
		
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
		
		List<Map> collect = new Vector<>();
		
		for(FreeBoardDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name","freeboard");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtService.commentCount(temp));
			
			collect.add(record);
		}	
		
		//페이징 문자열을 위한 로직 호출]
		if(map.get("searchWord") != null) {
			String searchWord = map.get("searchWord").toString();	
			String searchColumn = map.get("searchColumn").toString();	

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
			
			model.addAttribute("pagingString", pagingString);
		}
		
		else {
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?");
			model.addAttribute("pagingString", pagingString);
		}
		
		//데이터 저장]
		model.addAttribute("list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "board/freeboard/freeboard_main.tiles";
	}// free_main_count
	
	@RequestMapping("/animal/freeboard_hit.aw")
	public String free_main_hit(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		
		map.put("table_name","freeboard");
		map.put("hit", "test");
		
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
		
		List<Map> collect = new Vector<>();
		
		for(FreeBoardDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name","freeboard");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtService.commentCount(temp));
			
			collect.add(record);
		}	
		
		//페이징 문자열을 위한 로직 호출]
		if(map.get("searchWord") != null) {
			String searchWord = map.get("searchWord").toString();	
			String searchColumn = map.get("searchColumn").toString();	

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
			
			model.addAttribute("pagingString", pagingString);
		}
		
		else {
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
					req.getContextPath()+"/animal/freeboard.aw?");
			model.addAttribute("pagingString", pagingString);
		}
		
		//데이터 저장]
		model.addAttribute("list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "board/freeboard/freeboard_main.tiles";
		
	}// free_main_hit
	
	
	//상세보기
	@RequestMapping("animal/freeboard_view.aw")
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
	}// free_view
	
	//게시판 등록 폼으로 이동]
	@RequestMapping(value="/security/animal/freeboard/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/freeboard/freeboard_write.tiles";
	}// write()
	//게시판 입력처리]
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
	}// writeOk

	//수정폼으로 이동 및 수정 처리]
	@RequestMapping("/animal/freeboard/edit.aw")
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
	}// edit
	
	//삭제 처리
	@RequestMapping("/animal/freeboard/delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		int successFail = freeservice.delete(map);
		model.addAttribute("successFail", successFail);
		return "board/freeboard/Message";
	}// delete
		
	//Summernote s3 업로드 기능
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
    }// imageUpload
	
	@ResponseBody
	@RequestMapping(value="/animal/freeboard/free_hit.aw",method=RequestMethod.POST)
	public String hit(@RequestParam Map map) throws Exception{
	
		map.put("no", map.get("no").toString());
		int hitCount= freeservice.addHitCount(map);
		
		return "success";
	}// hit
	
	//---------------------------------------------------------------------------------------------------------------------------------
	//free_comment
	//서비스 주입
	@Resource(name="allCommentService")
	private AllCommentServiceImpl cmtService;
	
	@ResponseBody
	@RequestMapping(value="/animal/freeboard/cmt_write.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
	public String write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
		
		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "freeboard");
		map.put("no", map.get("no"));
		
		cmtService.insert(map);
		
		return map.get("no").toString();
		
	}// write
	
	@ResponseBody
	@RequestMapping(value="/animal/freeboard/cmt_list.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
	public String list(@RequestParam Map map,HttpSession model) throws Exception{
		
		map.put("table_name", "freeboard");
		map.put("origin_no", map.get("no"));
		
		List<AllCommentDTO> collections = cmtService.selectList(map);
		
		List<Map> comments = new Vector<>();
		
		for (AllCommentDTO dto : collections) {
			
	         Map record = new HashMap();
	         record.put("cmt_no", dto.getCmt_no());
	         model.setAttribute("cmt_no", dto.getCmt_no());
	         record.put("cmt_content", dto.getCmt_content());
	         record.put("mem_nickname", dto.getMem_nickname());
	         record.put("regidate", dto.getRegidate().toString());
	         record.put("origin_no", dto.getOrigin_no());
	         record.put("mem_no", dto.getMem_no());      
	         
	         comments.add(record);
	      }		
		
		return JSONArray.toJSONString(comments);
	}// list
	
	@ResponseBody
	@RequestMapping(value="/animal/freeboard/cmt_edit.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
	public String update(@RequestParam Map map,HttpSession session) throws Exception{
		
		map.put("table_name", "freeboard");
		map.put("cmt_content", map.get("cmt_content"));
		/*
		Set<String> set = map.keySet();
		for(String key:set) {
			System.out.println(key+":"+map.get(key));
		}
		*/
		cmtService.update(map);
		
		return map.get("no").toString();
	}// update
	
	@ResponseBody
	@RequestMapping(value="/animal/freeboard/cmt_delete.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
	public String delete(@RequestParam Map map,HttpSession session) throws Exception{
		
		map.put("table_name", "freeboard");
		//map.put("cmt_no", session.getAttribute("cmt_no"));
		
		cmtService.delete(map);
		
		return map.get("no").toString();
	}// delete
		
}//////////////////// FreeboardController

