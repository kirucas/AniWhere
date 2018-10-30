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

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.miss.FindSeeDTO;

@Controller
public class MissMainController {
	
	@Resource(name="findSeeService")
    private AllCommonService service;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//miss_main 이동
	@RequestMapping("/miss/miss_main.aw")
	public String miss_main() throws Exception {		
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
		
		model.addAttribute("list", list);
		
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
			
			model.addAttribute("list", list);
			
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
		
		
		//================================================================================================================
		
}//////////////////// MissMainController class
