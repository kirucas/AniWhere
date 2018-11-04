package com.animal.aniwhere.web.board.animal.cat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.aniwhere.service.animal.MovieBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.MovieBoardServiceImpl;

@Controller
public class CatMovieController {

	private static final int CAT = 2;
	private static final int PAGESIZE = 12;

	// 서비스 주입]
	@Resource(name = "movieService")
	private MovieBoardServiceImpl service;

	// 목록처리]
	// 리소스파일(memo.properties)에서 읽어오기
	@Value("${BLOCKPAGE}")
	private int blockPage;

	@RequestMapping("/cat/movie/List.aw")
	public String list(@RequestParam Map map, // 검색용 파라미터 받기
			@RequestParam(required = false, defaultValue = "1") int nowPage, // 페이징용 nowPage파라미터 받기용
			Model model, HttpServletRequest req// 페이징용 메소드에 전달
	) throws Exception {
		map.put("ani_category", CAT);
		// 서비스 호출]
		// 페이징을 위한 로직 시작]
		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		System.out.println(totalRecordCount);
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
				System.out.println("content:" + content);
				String src = "<iframe";
				int target_num = content.indexOf(src);
				String tempResult, result;
				String lightBox = " data-toggle=\"lightbox\"";
				if (target_num != -1) {
					tempResult = content.substring(target_num, content.indexOf("></iframe>") + "></iframe>".length());
					result = new StringBuffer(tempResult).insert(tempResult.lastIndexOf("></iframe>"), lightBox)
							.toString();
					System.out.println("result:" + result);
					dto.setMovie_tempsrc(result);
				} 
				else {
					continue;
				}
			}
			break;
		}
		// 페이징 문자열을 위한 로직 호출]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, PAGESIZE, blockPage, nowPage,
				req.getContextPath() + "/cat/movie/List.aw?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", PAGESIZE);

		// 뷰정보반환]
		return "forward:/animal/cat/movie.aw";
	}//////////////// list()

	// 등록 폼으로 이동]
	@RequestMapping(value = "/security/animal/cat/movie/Write.aw", method = RequestMethod.GET)
	public String movie_write() throws Exception {
		return "board/animal/cat/movie/movieWrite_form.tiles";
	}///////////////////////////

	// 입력처리용]
	@RequestMapping(value = "/security/animal/cat/movie/Write.aw", method = RequestMethod.POST)
	public String write(@RequestParam Map map) throws Exception {
		
		// 서비스 호출
		service.insert(map);
		// 뷰정보 반환
		return "forward:/cat/movie/List.aw";
	}

	// 상세보기]
	@RequestMapping("/cat/movie/view.aw")
	public String movie_view(@RequestParam Map map, Model model) throws Exception {
		// 게시글
		MovieBoardDTO dto = service.selectOne(map);
		// 유튜브 iframe소스를 가져와서 섬머노트와 같이 있는 내용과 분리하여 뿌리는 메소드
		//(데이터 베이스 상에는 관련 컬럼이 없으므로)
		setIframe(dto);
		
		// 데이타 저장]
		model.addAttribute("dto", dto);
		
		// 뷰정보 반환]
		return "board/animal/cat/movie/movie_view.tiles";
	}/////////////////////

	//수정폼으로 이동 및 수정 처리]
		@RequestMapping("/security/animal/cat/movie/edit.aw")
		public String movie_edit(Model model, @RequestParam Map map, HttpServletRequest req) throws Exception{
			System.out.println("post방식 : " + req.getMethod().equals("POST"));
			if(!req.getMethod().equals("POST")) {
				//서비스 호출]
				MovieBoardDTO dto = service.selectOne(map);
				//데이타 저장]
				model.addAttribute("dto", dto);
				//수정 폼으로 이동]
				return "board/animal/cat/movie/movieEdit_form.tiles";
			}
			//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
			int successFail =service.update(map);
			model.addAttribute("successFail", successFail);
			model.addAttribute("WHERE","EDT");
			model.addAttribute("no",map.get("no"));
			System.out.println("model" +model);
			return "/board/animal/cat/movie/movieMessage";
		}//////////////////
	
	//삭제 처리]
		@RequestMapping("/cat/movie/delete.aw")
		public String delete(@RequestParam Map map,Model model) throws Exception{
			int successFail =service.delete(map);
			model.addAttribute("successFail", successFail);
			return "/board/animal/cat/movie/movieMessage";
		}////////////////////////////////////////////////
		
	// content안에 있는 유튜브 소스와 내용을 순서대로 분리하여
	private void setIframe(MovieBoardDTO dto) {
		String content = dto.getMovie_content(); //content 얻기
		System.out.println("content:" + content);
		String src = "<iframe"; 
		int target_num = content.indexOf(src); //<iframe 글자 수가 target_num
		String tempResult, result;
		String lightBox = " data-toggle=\"lightbox\"";
		if (target_num != -1) { //<iframe이 소스 안에 있다면...
			//<iframe태그 내용만 도려내기
			tempResult = content.substring(target_num, content.indexOf("></iframe>") + "></iframe>".length());
			//result에 light박스 토글 추가
			result = new StringBuffer(tempResult).insert(tempResult.lastIndexOf("></iframe>"), lightBox).toString();
			//grandResult에 embed-responsive로 변환
			String grandResult = result.replace("note-video-clip","embed-responsive-item");
			System.out.println("grandResult:" + grandResult);
			dto.setMovie_tempsrc(grandResult);
		/*	
			//<iframe>을 잘라낸 나머지를 내용으로 추출.
			String netContent = content.replace(tempResult, "");
			System.out.printf("netContent : %s", netContent);
			dto.setMovie_content(netContent);
			*/
		}
	}
}//////////////////// MovieController class
