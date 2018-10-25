package com.animal.aniwhere.web.board.animal.bird;

import java.util.HashMap;
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
public class BirdMovieController {
	
	//서비스 주입]
		@Resource(name="movieService")
		private MovieBoardServiceImpl service;
		
		//목록처리]
		//리소스파일(memo.properties)에서 읽어오기
		@Value("${PAGESIZE}")
		private int pageSize;
		@Value("${BLOCKPAGE}")
		private int blockPage;
		
		@RequestMapping("/bird/movie/List.aw")
		public String list(
				@RequestParam Map map,//검색용 파라미터 받기
				@RequestParam(required=false,defaultValue="1") 
				int nowPage,//페이징용 nowPage파라미터 받기용
				Model model,
				HttpServletRequest req//페이징용 메소드에 전달
				) throws Exception{
			map.put("ani_category", 4);
			//서비스 호출]
			//페이징을 위한 로직 시작]
			//전체 레코드 수
			System.out.println(map.get("ani_category"));
			int totalRecordCount= service.getTotalRecord(map);	
			System.out.println(totalRecordCount);
			//시작 및 끝 ROWNUM구하기]
			int start = (nowPage-1)*pageSize+1;
			int end   = nowPage*pageSize;
			map.put("start",start);
			map.put("end",end);
			//페이징을 위한 로직 끝]	
			List<MovieBoardDTO> list= service.selectList(map);
			System.out.println("list:"+list);
			
			for(MovieBoardDTO dto : list) {
			
				String content = dto.getMovie_content();
				System.out.println("content:"+content);
				String src="<iframe";
				int target_num = content.indexOf(src);
				String result;
				if(target_num!=-1) {
						result=content.substring(target_num,(content.substring(target_num).indexOf("</iframe>")+target_num));
						System.out.println("result:"+result);
						dto.setMovie_tempsrc(result);	
				}
				else {
					
				}
				
			}
			//페이징 문자열을 위한 로직 호출]
//			String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/movie/List.aw?");
			//데이타 저장]
			model.addAttribute("list", list);
//			model.addAttribute("pagingString", pagingString);
//			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			
			//뷰정보반환]
			return "forward:/animal/bird/movie.aw";
		}////////////////list()
			
	//등록 폼으로 이동]
	@RequestMapping(value="/animal/bird/movie/Write.aw",method=RequestMethod.GET)
	public String movie_write() throws Exception{
		return "board/animal/bird/movie/movieWrite_form.tiles";
	}///////////////////////////
	
	
	//입력처리용]
	@RequestMapping(value="/animal/bird/movie/Write.aw",method=RequestMethod.POST)
	public String write(@RequestParam Map map
			) throws Exception{
		//서비스 호출
		service.insert(map);
		//뷰정보 반환
		return "forward:/main.aw";
	}
	
	//상세보기]
		@RequestMapping("/bird/movie/view.aw")
		public String movie_view(@RequestParam Map map,Model model) throws Exception{
			//서비스 호출]
			//게시글 
			MovieBoardDTO dto= service.selectOne(map);		
			//데이타 저장]
			model.addAttribute("dto", dto);	
			//뷰정보 반환]
			return "/bird/movie/movie_view.tiles";
		}/////////////////////
	
	@RequestMapping("/bird/movie/edit.aw")
	   public String movie_edit() throws Exception {
	      return "/board/animal/bird/movie/movieEdit_form.tiles";
	   }
}//////////////////// MovieController class