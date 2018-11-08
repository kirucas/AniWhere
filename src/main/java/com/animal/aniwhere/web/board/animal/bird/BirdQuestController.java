package com.animal.aniwhere.web.board.animal.bird;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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
import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.animal.QuestBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class BirdQuestController {
public static final int ANI_CATEGORY = 4;
	
	//서비스 주입
	@Resource(name="questService")
	private AllBoardService questService;
	@Resource(name="allCommentService")
	private AllCommentService allCommentService;
	
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//목록 가져오기
	@RequestMapping("/animal/bird/quest/quest_list.aw")
	public String list(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage,//페이징용 nowPage파라미터 받기용
			HttpSession session) throws Exception{
		map.put("ani_category", ANI_CATEGORY);
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
		
		List<Map> collect = new Vector<>();
		for(QuestBoardDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name","quest");
			temp.put("no", dto.getNo());
			record.put("cmtCount", allCommentService.commentCount(temp));
			
			collect.add(record);
		}
		//페이징 문자열을 위한 로직 호출]
		if(map.get("searchWord") != null) {
	         String searchWord = map.get("searchWord").toString();   
	         String searchColumn = map.get("searchColumn").toString();   

	         String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
	               req.getContextPath()+"/animal/bird/quest/quest_list.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
	         
	         model.addAttribute("pagingString", pagingString);
	      }
	      
	      else {
	         String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
	               req.getContextPath()+"/animal/bird/quest/quest_list.aw?");
	         model.addAttribute("pagingString", pagingString);
	      }
		//데이타 저장]
		//model.addAttribute("list", list);
		model.addAttribute("list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		//뷰정보반환]
		return "board/animal/bird/quest/quest_list.tiles";
	}////////////////list()
	
	//작성,답변,수정폼으로 이동
	@RequestMapping(value="/security/animal/bird/quest/quest_{path}",method=RequestMethod.GET)
	public String form(@PathVariable String path,Model model,@RequestParam Map map) throws Exception{
		switch(path) {
			case "write":
				//뷰정보 반환]
				return "board/animal/bird/quest/quest_write.tiles";
			default:
				//서비스 호출]
				QuestBoardDTO record = questService.selectOne(map);
				//데이타 저장]
				model.addAttribute("record", record);
				//뷰정보 반환]
				return "board/animal/bird/quest/quest_"+path+".tiles";		
		}		
	}
	
	//작성 처리
	@RequestMapping(value="/security/animal/bird/quest/quest_write.aw",method=RequestMethod.POST)
	public String quest_write(@RequestParam Map map,HttpSession session) throws Exception{
		map.put("mem_no",session.getAttribute("mem_no"));
		//서비스 호출]
		questService.insert(map);
		//뷰정보 반환]
		return "forward:/animal/bird/quest/quest_list.aw";
	}
	
	//답변 처리
	@RequestMapping(value="/security/animal/bird/quest/quest_reply.aw",method=RequestMethod.POST)
	public String quest_reply(@RequestParam Map map,HttpSession session,Model model) throws Exception {
		map.put("mem_no",session.getAttribute("mem_no"));
		//서비스 호출]
		questService.insert(map);
		//뷰정보 반환]
		return "forward:/animal/bird/quest/quest_list.aw";
	}
	
	//상세보기
	@RequestMapping("/animal/bird/quest/quest_view.aw")
	public String quest_view(@RequestParam Map map,Model model) throws Exception{
		//서비스 호출]
		QuestBoardDTO record = questService.selectOne(map);
		//줄바꿈
		record.setQuest_content(record.getQuest_content().replace("\r\n","<br/>"));
		//데이타 저장]
		model.addAttribute("record",record);
		//뷰정보 반환]
		return "board/animal/bird/quest/quest_view.tiles";
	}
	
	//수정 처리
	@RequestMapping("/security/animal/bird/quest/quest_edit.aw")
	public String edit(Model model,@RequestParam Map map, HttpServletRequest req) throws Exception{
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			QuestBoardDTO record = questService.selectOne(map);
			//데이타 저장]
			model.addAttribute("record",record);
			//뷰정보 반환]
			return "board/animal/bird/quest/quest_edit.tiles";
		}
		//서비스 호출]
		int successFail = questService.update(map);
		//데이타 저장]
		model.addAttribute("successFail",successFail);
		model.addAttribute("WHERE","EDT");
		//뷰정보 반환]
		return "board/animal/bird/quest/quest_message";
	}

	//삭제 처리
	@RequestMapping("/animal/bird/quest/quest_delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		//서비스 호출]
		int successFail = questService.delete(map);
		//데이타 저장]
		model.addAttribute("successFail",successFail);
		model.addAttribute("checking",map.get("checking"));
		//뷰정보 반환]
		return "board/animal/bird/quest/quest_message";
	}
	
	//이미지 업로드
	@ResponseBody
	@RequestMapping(value="/animal/bird/quest/Upload.aw")
	public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "quest"); // S3  업로드
		return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
	}
	
	//추천 수 
	@ResponseBody
	@RequestMapping(value="/animal/bird/quest/quest_hit.aw",method=RequestMethod.POST)
	public String hit(@RequestParam Map map) throws Exception{
		map.put("no", map.get("no").toString());
		//서비스 호출]
		int hitCount= questService.addHitCount(map);
		return "success";
	}//////////////hit()
}//////////////////// StoryController
