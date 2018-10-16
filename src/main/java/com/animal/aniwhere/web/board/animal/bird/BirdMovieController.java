package com.animal.aniwhere.web.board.animal.bird;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.aniwhere.service.animal.MovieBoardDTO;
import com.animal.aniwhere.service.impl.animal.MovieBoardDAO;
import com.animal.aniwhere.service.impl.animal.MovieBoardServiceImpl;

@Controller
public class BirdMovieController {
	
	//서비스 주입]
		@Resource(name="movieService")
		private MovieBoardServiceImpl service;
	
	
		//등록 폼으로 이동]
		@RequestMapping(value="/animal/bird/movie/write.aw",method=RequestMethod.GET)
		public String movie_write() throws Exception{
			return "board/animal/bird/movie/movieWrite_form.tiles";
		}///////////////////////////
	
	@RequestMapping(value="/animal/bird/movie/{path}",method=RequestMethod.GET)
	public String form(@PathVariable String path,Model model,@RequestParam Map map) throws Exception{
		switch(path) {
			case "Write":
				//뷰정보 반환]
				return "movie/Write.tiles";
			default:
				//서비스 호출]
				MovieBoardDTO dto= service.selectOne(map);
				//데이타 저장] 
				model.addAttribute("record", dto);
				//뷰정보 반환]
				return "bbs/"+path+".tiles";		
		}		
	}///////////////write()
	//입력처리용]
	@RequestMapping(value="/animal/bird/movie/Write.aw",method=RequestMethod.POST)
	public String write(
			MovieBoardDTO dto,@RequestParam Map map, 
			@ModelAttribute("mem_nickname") String mem_nickname//세션영역에서 읽기용
			) throws Exception{
		//서비스 호출
		//먼저 아이디 설정후 호출
		dto.setMem_nickname(mem_nickname);
		service.insert(map);
		//뷰정보 반환
		return "forward:/animal/bird/movie/List.aw";
	}
	
	@RequestMapping("/animal/bird/movie/view.aw")
	   public String movie_view() throws Exception {
	      return "board/animal/bird/movie/movie_view.tiles";
	   }
	
	@RequestMapping("/animal/bird/movie/edit.aw")
	   public String movie_edit() throws Exception {
	      return "board/animal/bird/movie/movieEdit_form.tiles";
	   }
}//////////////////// MovieController class