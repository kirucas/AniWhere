package com.animal.aniwhere.web.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.NoticeDTO;
import com.animal.aniwhere.service.animal.FreeBoardDTO;
import com.animal.aniwhere.service.impl.NoticeServiceImpl;
import com.animal.aniwhere.service.impl.PagingUtil;

@Controller
public class NoticeController {

	@Resource(name="noticeService")
	private NoticeServiceImpl service;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;

	@RequestMapping(value="/notice/List.aw")
	public String notice(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount= service.getTotalRecord(map);
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]
		List<NoticeDTO> list = service.selectList(map);
		//페이징 문자열을 위한 로직 호출]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/notice/List.aw?");
		//데이터 저장]
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "notice/notice.tiles";
	}////////// free_main
	
	//상세보기용]
		@ResponseBody
		@RequestMapping(value="/notice/View.awa",produces="text/plain; charset=UTF-8")
		public String view(@RequestParam Map map) throws Exception{
			//서비스 호출]
			NoticeDTO record=service.selectOne(map);
			//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
			JSONObject json = new JSONObject();
			//JSON객체의 put("키값","값")메소드로 저장하면
			//{"키값":"값"} JSON형태의 데이타로 저장됨.
			//json.put("record", record);
			json.put("content", record.getContent());
			json.put("title", record.getTitle());
			System.out.println(record.getContent());
			//뷰정보 반환]
			return json.toJSONString();
		}///////////////view()

}
