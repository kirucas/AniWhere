package com.animal.aniwhere.web.board.miss;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.miss.FindSeeServiceImpl;
import com.animal.aniwhere.service.impl.miss.LostAnimalServiceImpl;
import com.animal.aniwhere.service.miss.FindSeeDTO;
import com.animal.aniwhere.service.miss.LostAnimalDTO;
import com.animal.aniwhere.web.board.FileUpDownUtils;


@Controller
public class MissMainController {
	
	@Resource(name="findSeeService")
    private FindSeeServiceImpl service;
	
	//보호소 컨트롤러
	@Resource(name="lostAniService")
	private LostAnimalServiceImpl lostservice;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//miss_main 이동
	@RequestMapping("/miss/miss_main.aw")
	public String miss_main(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {	
		
		map.put("table_name", "see");
		
		if(map.get("table_name") == "see") {
			//전체 레코드 수
			int totalRecordCount= service.getTotalRecord(map);
			//페이지 사이즈
			//전체 페이지수]
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			//현재 페이지를 파라미터로 받기]		
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize-1;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]
				
			List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);
				
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/miss_main.aw?");
				
			model.addAttribute("list", list);
				
			model.addAttribute("pagingString", pagingString);		
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			
		}/////////////////////////////////////////////////////////////////// 봤어요 리스트
		
		map.put("table_name", "find");
		
		if(map.get("table_name") == "find") {
			int totalRecordCount= service.getTotalRecord(map);
			//페이지 사이즈
			//전체 페이지수]
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			//현재 페이지를 파라미터로 받기]		
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize-1;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]
				
			List<FindSeeDTO> list2 = (List<FindSeeDTO>) service.selectList(map);
				
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/miss_main.aw?");
				
			model.addAttribute("list2", list2);
				
			model.addAttribute("pagingString", pagingString);		
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			
		}/////////////////////////////////////////////////////////////////// 찾아요 리스트
		
		
			//전체 레코드 수
			int totalRecordCount= lostservice.getTotalRecord(map);
			//페이지 사이즈
			//전체 페이지수]
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			//현재 페이지를 파라미터로 받기]		
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize-2;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]
					
			List<LostAnimalDTO> list3 = (List<LostAnimalDTO>) lostservice.selectList(map);
					
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/shelter.aw?");
					
			model.addAttribute("list3", list3);
					
			model.addAttribute("pagingString", pagingString);		
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			
			///////////////////////////////////////////////////////////////////// 보호소 리스트
		
		return "miss/miss_main.tiles";
	}////////// miss_main
	
	//see or find 메인으로 이동
	@RequestMapping("/miss/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "miss/" + path + "/" + path + "_main.tiles";
	}////////// move_board/miss/find.aw
	
	//_main -> _write로 이동
	@RequestMapping("/miss/{path}_write.aw")
	public String miss_write(@PathVariable String path) throws Exception {		
		return "miss/" + path + "/" + path + "_write.tiles";
	}////////// miss_write
	
	
	//========================================================================================
	
	
	//입력 후 리스트로 이동
	@RequestMapping("/miss/see_insert.aw")
	public String miss_insert(@RequestParam Map map,HttpSession session) throws Exception {
		
		map.put("mem_no", session.getAttribute("mem_no"));
		
		service.insert(map);
			
		return "forward:/miss/see.aw";
	}////////// miss_write
	
	//리스트로 이동
	@RequestMapping("/miss/see.aw")
	public String see_list(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {
				
		map.put("table_name", "see");
		//전체 레코드 수
		int totalRecordCount= service.getTotalRecord(map);
		//페이지 사이즈
		//전체 페이지수]
		int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
		//현재 페이지를 파라미터로 받기]		
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]
		/*	
		Set<String> set = map.keySet();
		for(String key:set) {
			System.out.println(key+":"+map.get(key));
		}
		*/
		List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);
		
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/see.aw?");
		
		model.addAttribute("see_list", list);
		
		model.addAttribute("pagingString", pagingString);		
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
				
		return "miss/see/see_main.tiles";
	}////////// miss_write
	
	
	//상세보기
	@RequestMapping("/miss/see_view.aw")
	public String see_view(@RequestParam Map map,Model model,HttpSession session) throws Exception {	
		
		map.put("mem_no",session.getAttribute("mem_no"));
		map.put("table_name","see");
		map.put("no", map.get("see_no"));
		
		//게시글
		FindSeeDTO record = service.selectOne(map);
		//데이터 저장]
		model.addAttribute("record", record);
		//줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));
		
		record.setCount(record.getCount());
			
		//뷰정보 반환]
		return "miss/see/see_view.tiles";
	}////////// miss_view
	
	//수정폼 이동
	@RequestMapping("/miss/see_edit.aw")
	public String miss_edit(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
			
		map.put("mem_no",session.getAttribute("mem_no"));
		map.put("table_name","see");
		map.put("no", map.get("see_no"));
		
		//게시글
		FindSeeDTO record = service.selectOne(map);
		//데이터 저장]
		model.addAttribute("record", record);
		//줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));
		
		return "miss/see/see_edit.tiles";
	}////////// miss_write
	
	//수정
	@RequestMapping("/miss/see_update.aw")
	public String miss_update(@RequestParam Map map,HttpSession session,Model model) throws Exception {
				
		map.put("mem_no",session.getAttribute("mem_no"));
		map.put("table_name","see");
		map.put("no",map.get("see_no"));
		
		/*
		Set<String> set = map.keySet();
		for(String key:set) {
			System.out.println(key+":"+map.get(key));
		}
	    */
		//게시글
		service.update(map);
					
		return "forward:/miss/see.aw";
	}////////// miss_write
	
	//삭제
	@RequestMapping("/miss/see_delete.aw")
	public String miss_delete(@RequestParam Map map,HttpSession session,Model model) throws Exception {
			
		map.put("mem_no",session.getAttribute("mem_no"));
		map.put("table_name","see");
		map.put("no",map.get("see_no"));
			
		service.delete(map);
						
		return "forward:/miss/see.aw";
	}////////// miss_write
	
	//Summernote 업로드 기능
	@ResponseBody
	@RequestMapping(value="/miss/see_upload/Upload.aw")
	public String see_upload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		//File file = new File(phisicalPath+File.separator+newFilename);
		//upload.transferTo(file);
			
		List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "see"); // S3  업로드
			
	    //return "/Upload/"+newFilename;
		return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
	}
	
	
	//================================================================================================================
	
	
	//입력 후 리스트로 이동
		@RequestMapping("/miss/find_insert.aw")
		public String find_insert(@RequestParam Map map,HttpSession session) throws Exception {
			
			map.put("mem_no", session.getAttribute("mem_no"));
			
			service.insert(map);
				
			return "forward:/miss/find.aw";
		}////////// miss_write
		
		//리스트로 이동
		@RequestMapping("/miss/find.aw")
		public String find_list(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {
			
			map.put("table_name", "find");
			
			//전체 레코드 수
			int totalRecordCount= service.getTotalRecord(map);
			//페이지 사이즈
			//전체 페이지수]
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			//현재 페이지를 파라미터로 받기]		
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]
			
			List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);
			
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/find.aw?");
			
			model.addAttribute("find_list", list);
			
			model.addAttribute("pagingString", pagingString);		
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
					
			return "miss/find/find_main.tiles";
		}////////// miss_write
		
		
		//상세보기
		@RequestMapping("/miss/find_view.aw")
		public String find_view(@RequestParam Map map,Model model,HttpSession session) throws Exception {	
			
			map.put("mem_no",session.getAttribute("mem_no"));
			map.put("table_name","find");
			map.put("no", map.get("find_no"));
			
			//게시글
			FindSeeDTO record = service.selectOne(map);
			//데이터 저장]
			model.addAttribute("record", record);
			//줄바꿈처리
			record.setContent(record.getContent().replace("\r\n", "<br/>"));
			//조회수 증가
			record.setCount(record.getCount());
			
			//뷰정보 반환]
			return "miss/find/find_view.tiles";
		}////////// miss_view
		
		//수정폼 이동
		@RequestMapping("/miss/find_edit.aw")
		public String find_edit(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
				
			map.put("mem_no",session.getAttribute("mem_no"));
			map.put("table_name","find");
			map.put("no", map.get("find_no"));
			
			//게시글
			FindSeeDTO record = service.selectOne(map);
			//데이터 저장]
			model.addAttribute("record", record);
			//줄바꿈처리
			record.setContent(record.getContent().replace("\r\n", "<br/>"));
			
			return "miss/find/find_edit.tiles";
		}////////// miss_write
	
	//수정
		@RequestMapping("/miss/find_update.aw")
		public String find_update(@RequestParam Map map,HttpSession session,Model model) throws Exception {
					
			map.put("mem_no",session.getAttribute("mem_no"));
			map.put("table_name","find");
			map.put("no",map.get("find_no"));
			
			/*
			Set<String> set = map.keySet();
			for(String key:set) {
				System.out.println(key+":"+map.get(key));
			}
		    */
			//게시글
			service.update(map);
						
			return "forward:/miss/find.aw";
		}////////// miss_write
		
		//삭제
		@RequestMapping("/miss/find/find_delete.aw")
		public String find_delete(@RequestParam Map map,HttpSession session,Model model) throws Exception {
				
			map.put("mem_no",session.getAttribute("mem_no"));
			map.put("table_name","find");
			map.put("no",map.get("find_no"));
				
			service.delete(map);
							
			return "forward:/miss/find.aw";
		}////////// miss_write
		
		//Summernote 업로드 기능
		@ResponseBody
		@RequestMapping(value="/miss/find_upload/Upload.aw")
		public String find_upload(MultipartHttpServletRequest mhsr) throws Exception {
			String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
			MultipartFile upload = mhsr.getFile("file");
			String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			//File file = new File(phisicalPath+File.separator+newFilename);
			//upload.transferTo(file);
				
			List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "find"); // S3  업로드
				
		    //return "/Upload/"+newFilename;
			return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
		}
		
		//================================================================================================================
		
		
		//리스트로 이동
		@RequestMapping("/miss/shelter.aw")
		public String lost_main(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception {
					
			//전체 레코드 수
			int totalRecordCount= lostservice.getTotalRecord(map);
			//페이지 사이즈
			//전체 페이지수]
			int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
			//현재 페이지를 파라미터로 받기]		
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize-1;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]
					
			List<LostAnimalDTO> list = (List<LostAnimalDTO>) lostservice.selectList(map);
					
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/miss/shelter.aw?");
					
			model.addAttribute("list", list);
					
			model.addAttribute("pagingString", pagingString);		
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
							
			return "miss/shelter/shelter_main.tiles";
		}////////// miss_write
		
		
		//상세보기
		@RequestMapping("/miss/shelter_view.aw")
		public String shelter_view(@RequestParam Map map,Model model,HttpSession session) throws Exception {	
			
			map.put("no", map.get("shelter_no"));
			
			//게시글
			LostAnimalDTO record = lostservice.selectOne(map);
			//데이터 저장]
			model.addAttribute("record", record);
						
			//뷰정보 반환]
			return "miss/shelter/shelter_view.tiles";
		}////////// miss_view
		
		
	//---------------------------------------------------------------------------------------------------------------------------------
		
	
	
	
}//////////////////// MissMainController class



