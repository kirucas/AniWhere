package com.animal.aniwhere.web.board.animal.dog;

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

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.animal.MovieBoardDTO;
import com.animal.aniwhere.service.impl.AllCommentServiceImpl;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.MovieBoardServiceImpl;

@Controller
public class DogMovieController {

	private static final int DOG = 1;
	private static final int PAGESIZE = 12;

	// 서비스 주입]
	@Resource(name = "movieService")
	private MovieBoardServiceImpl service;

	@Resource(name = "allCommentService")
	private AllCommentServiceImpl cmtservice; //댓글 서비스
	
	
	// 목록처리]
	// 리소스파일(memo.properties)에서 읽어오기
	@Value("${BLOCKPAGE}")
	private int blockPage;

	@RequestMapping("/dog/movie/List.aw")
	public String list(@RequestParam Map map, // 검색용 파라미터 받기
			@RequestParam(required = false, defaultValue = "1") int nowPage, // 페이징용 nowPage파라미터 받기용
			Model model, HttpServletRequest req// 페이징용 메소드에 전달
	) throws Exception {
		map.put("ani_category", DOG);
		// 서비스 호출]
		// 페이징을 위한 로직 시작]
		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * PAGESIZE + 1;
		int end = nowPage * PAGESIZE;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]
		List<MovieBoardDTO> list = service.selectList(map);

		while (true) {
			for (MovieBoardDTO dto : list) {
				String content = dto.getMovie_content();
				String src = "<iframe";
				int target_num = content.indexOf(src);

				String tempResult, result;
				String enablejsapi = "?enablejsapi=1";
				
				if (target_num != -1) {
					tempResult = content.substring(target_num, content.indexOf("></iframe>") + "></iframe>".length());
				String idAdded	= new StringBuffer(tempResult).insert(tempResult.lastIndexOf("src"), "id=\"player\" ").toString();
					String enablejsApi = new StringBuffer(idAdded).insert(idAdded.indexOf("\"", 26), "?enablejsapi=1&rel=0").toString();
					dto.setMovie_tempsrc(enablejsApi);				
				} 
				else {
					continue;
				}
			}
			break;
		}
		// 페이징 문자열을 위한 로직 호출]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, PAGESIZE, blockPage, nowPage,
				req.getContextPath() + "/dog/movie/List.aw?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", PAGESIZE);

		// 뷰정보반환]
		return "forward:/animal/dog/movie.aw";
	}//////////////// list()

	// 등록 폼으로 이동]
	@RequestMapping(value = "/security/animal/dog/movie/Write.aw", method = RequestMethod.GET)
	public String movie_write() throws Exception {
		return "board/animal/dog/movie/movieWrite_form.tiles";
	}///////////////////////////

	// 입력처리용]
	@RequestMapping(value = "/security/animal/dog/movie/Write.aw", method = RequestMethod.POST)
	public String write(@RequestParam Map map) throws Exception {
		
		// 서비스 호출
		service.insert(map);
		// 뷰정보 반환
		return "forward:/dog/movie/List.aw";
	}

	// 상세보기]
	@RequestMapping("/dog/movie/view.aw")
	public String movie_view(@RequestParam Map map, Model model) throws Exception {
		// 게시글
		MovieBoardDTO dto = service.selectOne(map);
		// 유튜브 iframe소스를 가져와서 섬머노트와 같이 있는 내용과 분리하여 뿌리는 메소드
		//(데이터 베이스 상에는 관련 컬럼이 없으므로)
		setIframe(dto);
		
		// 데이타 저장]
		model.addAttribute("dto", dto);
		
		// 뷰정보 반환]
		return "board/animal/dog/movie/movie_view.tiles";
	}/////////////////////

	//수정폼으로 이동 및 수정 처리]
		@RequestMapping("/security/animal/dog/movie/edit.aw")
		public String movie_edit(Model model, @RequestParam Map map, HttpServletRequest req) throws Exception{
			if(!req.getMethod().equals("POST")) {
				//서비스 호출]
				MovieBoardDTO dto = service.selectOne(map);
				//데이타 저장]
				model.addAttribute("dto", dto);
				//수정 폼으로 이동]
				return "board/animal/dog/movie/movieEdit_form.tiles";
			}
			//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
			int successFail =service.update(map);
			model.addAttribute("successFail", successFail);
			model.addAttribute("WHERE","EDT");
			model.addAttribute("no",map.get("no"));
			return "/board/animal/dog/movie/movieMessage";
		}//////////////////
	
	//삭제 처리]
		@RequestMapping("/dog/movie/delete.aw")
		public String delete(@RequestParam Map map,Model model) throws Exception{
			int successFail =service.delete(map);
			model.addAttribute("successFail", successFail);
			return "/board/animal/dog/movie/movieMessage";
		}////////////////////////////////////////////////
		
	// content안에 있는 유튜브 소스와 내용을 순서대로 분리하여
	private void setIframe(MovieBoardDTO dto) {
		String content = dto.getMovie_content(); //content 얻기
		String src = "<iframe"; 
		int target_num = content.indexOf(src); //<iframe 글자 수가 target_num
		String tempResult, result;
		String lightBox = " data-toggle=\"lightbox\"";
		if (target_num != -1) { //<iframe이 소스 안에 있다면...
			//<iframe태그 내용만 도려내기
			tempResult = content.substring(target_num, content.indexOf("></iframe>") + "></iframe>".length());
			String idAdded	= new StringBuffer(tempResult).insert(tempResult.lastIndexOf("src"), "id=\"player\" ").toString();
			String enablejsApi = new StringBuffer(idAdded).insert(idAdded.indexOf("\"", 26), "?enablejsapi=1&rel=0").toString();
			//grandResult에 embed-responsive로 변환
			String grandResult = enablejsApi.replace("note-video-clip","embed-responsive-item");
			dto.setMovie_tempsrc(grandResult);
	
		}
	}
	
	//코멘트 입력처리]
			@ResponseBody
			@RequestMapping(value="/security/animal/dog/movie/commentWrite.awa",produces="text/plain; charset=UTF-8")
			public String write(@RequestParam Map map, HttpSession session,Model model) throws Exception{
				//맵에서 table_name 넣기
				String movie = "movie";
				map.put("table_name", movie);
				map.put("mem_no",session.getAttribute("mem_no"));
			
				//서비스 호출]		
				cmtservice.insert(map);	
				return map.get("no").toString();
			}///////////////////
			//특정 글번호에 대한 코멘트 전체 목록 가져오기
			@ResponseBody
			@RequestMapping(value="/board/animal/dog/movie/commentList.awa",produces="text/html; charset=UTF-8")
			public String list(@RequestParam Map map) throws Exception{
				//맵에서 table_name 넣기
				String movie = "movie";
				map.put("table_name", movie);
				//서비스 호출]
				List<AllCommentDTO> comments=cmtservice.selectList(map);
				
				// 댓글
				List<Map> collections = new Vector<Map>();
				for (AllCommentDTO cmtdto : comments) {
					Map record = new HashMap();
					record.put("regidate", cmtdto.getRegidate().toString());
					record.put("nickname", cmtdto.getMem_nickname());
					record.put("comment_content", cmtdto.getCmt_content());
					record.put("mem_no", cmtdto.getMem_no());
					record.put("cmt_no", cmtdto.getCmt_no());
					collections.add(record);
				}
				
				return JSONArray.toJSONString(collections);
			}/////////////////////
			
			//코멘트 수정 처리
			@ResponseBody
			@RequestMapping(value="/security/animal/dog/movie/commentEdit.awa",produces="text/html; charset=UTF-8")
			public String update(@RequestParam Map map) throws Exception{
				map.put("table_name", "movie");
				//서비스 호출]
				cmtservice.update(map);
				return map.get("no").toString();
			}/////////////////////////
			
			//코멘트 삭제처리]
			@ResponseBody
			@RequestMapping(value="/board/animal/dog/movie/commentDelete.awa",produces="text/html; charset=UTF-8")
			public String delete(@RequestParam Map map) throws Exception{
				map.put("table_name", "movie");
				//서비스 호출]
				cmtservice.delete(map);
				return map.get("no").toString();
			}/////////////////////////
	
}//////////////////// MovieController class
