package com.animal.aniwhere.web.board.animal.cat;

import java.io.File;
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
import com.animal.aniwhere.service.animal.TipBoardDTO;
import com.animal.aniwhere.service.impl.AllCommentServiceImpl;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.TipBoardServiceImpl;
import com.animal.aniwhere.web.board.FileUpDownUtils;	

@Controller
public class CatTipController {
	
	
	@Resource(name="tipService")
	private TipBoardServiceImpl tipservice;
	
	@Resource(name="allCommentService")
	private AllCommentServiceImpl cmtservice;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	@RequestMapping("/board/animal/cat/tip/list.aw")
	public String list(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		map.put("ani_category",2);
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount= tipservice.getTotalRecord(map);			
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		//페이징을 위한 로직 끝]
		List<TipBoardDTO> list = tipservice.selectList(map);
		List<Map> collect = new Vector<>();
		
		for(TipBoardDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name","tip");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtservice.commentCount(temp));
			
			collect.add(record);
		}	
		
		//페이징 문자열을 위한 로직 호출]
				if(map.get("searchWord") != null) {
					String searchWord = map.get("searchWord").toString();	
					String searchColumn = map.get("searchColumn").toString();	

					String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
							req.getContextPath()+"/board/animal/cat/tip/list.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
					
					model.addAttribute("pagingString", pagingString);
				}
				
				else {
					String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
							req.getContextPath()+"/board/animal/cat/tip/list.aw?");
					model.addAttribute("pagingString", pagingString);
				}
		//데이터 저장]
				
		model.addAttribute("list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
		return "board/animal/cat/tip/tip_list.tiles";
		
	}////////// tip_main
	
	//상세보기
	@RequestMapping("/animal/cat/tip/tip_view.aw")
	public String view(@RequestParam Map map,Model model) throws Exception {
		//서비스 호출]
		//게시글
		TipBoardDTO record = tipservice.selectOne(map);
		//데이터 저장]
		model.addAttribute("record", record);
		//줄바꿈처리
		record.setTip_content(record.getTip_content().replace("\r\n", "<br/>"));
		//뷰정보 반환]
		return "board/animal/cat/tip/tip_view.tiles";
	}////////// tip_main
	//등록 폼으로 이동 및 입력처리]
	@RequestMapping(value="/security/animal/cat/tip/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/cat/tip/tip_write.tiles";
	}////////////////
	//입력처리]
	@RequestMapping(value="/security/animal/cat/tip/write.aw",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session //,org.springframework.security.core.Authentication auth 아직 적용 안함
		) throws Exception{
		
		map.put("mem_no", session.getAttribute("mem_no"));
		
		tipservice.insert(map);
		//뷰정보반환
		return "forward:/board/animal/cat/tip/list.aw";//접두어 접미어 설정 적용 안되게끔 하려고 forward:를 붙임
	}////////////////

	//수정폼으로 이동 및 수정 처리]
	@RequestMapping("/security/board/animal/cat/tip/edit.aw")
	public String edit(HttpServletRequest req,@RequestParam Map map,Model model) throws Exception{
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			TipBoardDTO record = tipservice.selectOne(map);
			//수정 폼으로 이동]
			model.addAttribute("record", record);
			return "board/animal/cat/tip/tip_edit.tiles";
		}
		//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
		int successFail = tipservice.update(map);
		model.addAttribute("successFail", successFail);
		model.addAttribute("WHERE", "EDT");
		return "board/animal/cat/tip/Message";
	}//////////////edit()
	
	//삭제 처리
	@RequestMapping("/board/animal/cat/tip/delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		int successFail = tipservice.delete(map);
		model.addAttribute("successFail", successFail);
		return "board/animal/cat/tip/Message";
	}//////////////delete()
	
		
	//Summernote 업로드 기능
	@ResponseBody
    @RequestMapping(value="/animal/cat/tip/Upload.aw")
    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		//File file = new File(phisicalPath+File.separator+newFilename);
		
		List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "tip_bird"); // S3  업로드
		
        return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
   }
	@ResponseBody
	@RequestMapping(value="/animal/cat/tip/tip_hit.aw",method=RequestMethod.POST)
	public String hit(@RequestParam Map map) throws Exception{
	
		map.put("no", map.get("no").toString());
		int hitCount= tipservice.addHitCount(map);
		
		return "success";
	}//////////////hit()
	
	
	///댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글///
	
	//tip_birdComment
	@ResponseBody
	@RequestMapping(value = "/animal/catTip/cmt_write.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String write(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "tip");
		map.put("no", map.get("no"));

		cmtservice.insert(map);

		return map.get("no").toString();

	}///////////////////

	@ResponseBody
	@RequestMapping(value = "/animal/catTip/cmt_list.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String list(@RequestParam Map map, HttpSession model) throws Exception {

		map.put("table_name", "tip");
		map.put("origin_no", map.get("no"));

		List<AllCommentDTO> collections = cmtservice.selectList(map);

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
	}//////////////////

	@ResponseBody
	@RequestMapping(value = "/animal/catTip/cmt_edit.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String update(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "tip");
		map.put("cmt_content", map.get("cmt_content"));
		/*
		 * Set<String> set = map.keySet(); for(String key:set) {
		 * System.out.println(key+":"+map.get(key)); }
		 */
		cmtservice.update(map);

		return map.get("no").toString();
	}////////////

	@ResponseBody
	@RequestMapping(value = "/animal/catTip/cmt_delete.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String delete(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "tip");
		
		//map.put("cmt_no", session.getAttribute("cmt_no"));

		cmtservice.delete(map);

		return map.get("no").toString();
	}
}//////////////////// tipboardController

