package com.animal.aniwhere.web.board.animal.dog;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.AllCommentService;
import com.animal.aniwhere.service.animal.QuestBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class DogQuestController {
	
	public static final int ANI_CATEGORY = 1;
	
	@Resource(name="questService")
	private AllBoardService questService;
	@Resource(name="allCommentService")
	private AllCommentService allCommentService;
	
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	@RequestMapping("/animal/dog/quest/quest_list.aw")
	public String list(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage,//페이징용 nowPage파라미터 받기용
			HttpSession session) throws Exception{
		map.put("ani_category", ANI_CATEGORY);
		System.out.println(map.get("searchWord"));
		System.out.println(map.get("searchColumn"));
		
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount= questService.getTotalRecord(map);
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]
		List<QuestBoardDTO> list= (List<QuestBoardDTO>) questService.selectList(map);
		//페이징 문자열을 위한 로직 호출]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/animal/dog/quest/quest_list.aw?");
		//데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		//뷰정보반환]
		return "board/animal/dog/quest/quest_list.tiles";
	}////////////////list()
	
	@RequestMapping(value="/security/animal/dog/quest/quest_{path}",method=RequestMethod.GET)
	public String form(@PathVariable String path,Model model,@RequestParam Map map) throws Exception{
		switch(path) {
			case "write":
				//뷰정보 반환]
				return "board/animal/dog/quest/quest_write.tiles";
			default:
				//서비스 호출]
				QuestBoardDTO record = questService.selectOne(map);
				//데이타 저장]
				model.addAttribute("record", record);
				//뷰정보 반환]
				return "board/animal/dog/quest/quest_"+path+".tiles";		
		}		
	}
	
	
	@RequestMapping(value="/security/animal/dog/quest/quest_write.aw",method=RequestMethod.POST)
	public String quest_write(@RequestParam Map map,HttpSession session) throws Exception{
		map.put("mem_no",session.getAttribute("mem_no"));
		questService.insert(map);
		return "forward:/animal/dog/quest/quest_list.aw";
	}
	
	@RequestMapping(value="/security/animal/dog/quest/quest_reply.aw",method=RequestMethod.POST)
	public String quest_reply(@RequestParam Map map,HttpSession session,Model model) throws Exception {
		map.put("mem_no",session.getAttribute("mem_no"));
		questService.insert(map);
		return "forward:/animal/dog/quest/quest_list.aw";
	}
	
	@RequestMapping("/animal/dog/quest/quest_view.aw")
	public String quest_view(@RequestParam Map map,Model model) throws Exception{
		QuestBoardDTO record = questService.selectOne(map);
		record.setQuest_content(record.getQuest_content().replace("\r\n","<br/>"));
		model.addAttribute("record",record);
		return "board/animal/dog/quest/quest_view.tiles";
	}
	
	@RequestMapping("/security/animal/dog/quest/quest_edit.aw")
	public String edit(Model model,@RequestParam Map map, HttpServletRequest req) throws Exception{
		if(req.getMethod().equals("GET")) {
			QuestBoardDTO record = questService.selectOne(map);
			model.addAttribute("record",record);
			return "board/animal/dog/quest/quest_edit.tiles";
		}
		int successFail = questService.update(map);
		model.addAttribute("successFail",successFail);
		model.addAttribute("WHERE","EDT");
		return "board/animal/dog/quest/quest_message";
	}

	@RequestMapping("/animal/dog/quest/quest_delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		int successFail = questService.delete(map);
		model.addAttribute("successFail",successFail);
		return "board/animal/dog/quest/quest_message";
	}
	
	@ResponseBody
    @RequestMapping(value="/animal/dog/quest/Upload.aw")
    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFilename);
		upload.transferTo(file);
        return "/Upload/"+newFilename;
   }
}//////////////////// DogQuestController
