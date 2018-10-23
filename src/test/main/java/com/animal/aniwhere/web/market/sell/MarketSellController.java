package com.animal.aniwhere.web.market.sell;

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
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.market.BuySellDTO;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class MarketSellController {
	
	/*
	@Resource(name="buySellService")
	private AllBoardService allBoardService;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	//map.put("table_name","sell");
	
	@RequestMapping("/market/sell.aw")
	public String market_main(Model model,
			HttpServletRequest req,//페이징용 메소드에 전달
			@RequestParam Map map,//검색용 파라미터 받기
			@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
			)throws Exception {
		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드 수
		map.put("table_name","sell");
		int totalRecordCount= allBoardService.getTotalRecord(map);			
		//시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end   = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		
		
		
		//페이징을 위한 로직 끝]
		List<BuySellDTO> list = (List<BuySellDTO>) allBoardService.selectList(map);
		//페이징 문자열을 위한 로직 호출]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+ "/market/sell.aw?");
		//데이터 저장]
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		//뷰정보 반환]
	
		return "market/sell/temporarily.tiles";
		
	}////////// market_main
	
	//상세보기
	@RequestMapping("/market/sellinside.aw")
	public String sellinside(@RequestParam Map map,Model model) throws Exception {
		//서비스 호출]
		//게시글
		BuySellDTO record = allBoardService.selectOne(map);
		//데이터 저장]
		model.addAttribute("record", record);
		//줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>")); //???
		//뷰정보 반환]
		
		return "market/inside/sellinside.tiles";
		       
		
	}////////// sellinside
	
	
	//등록 폼으로 이동 및 입력처리]
	@RequestMapping(value="/market/SellWrite.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "market/write/SellWrite.tiles";
	}////////////////
	
	
	//입력처리]
	@RequestMapping(value="/market/SellWrite.aw",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session //,org.springframework.security.core.Authentication auth 아직 적용 안함
		) throws Exception{
		//서비스 호출
		//작성자의 id를 DTO에 설정
		//스프링 시큐리티 적용 전
		map.put("mem_no", session.getAttribute("mem_no"));
		//System.out.println("인증된 사용자:"+auth.getPrincipal());
		//UserDetails authenticatedUser = (UserDetails) auth.getPrincipal();
		//System.out.println("아이디 : "+authenticatedUser.getUsername());
		//System.out.println("비밀번호 : "+authenticatedUser.getPassword());
		//System.out.println("권한:"+authenticatedUser.getAuthorities().toString());
		//스프링 시큐리티적용 후
		//map.put("id", authenticatedUser.getUsername());
		allBoardService.insert(map);
		//뷰정보반환:목록으로 이동
		return "forward:/market/sell.aw";//접두어 접미어 설정 적용 안되게끔 하려고 forward:를 붙임
	
	}////////////////

	//수정폼으로 이동 및 수정 처리]
	@RequestMapping("/market/editSellWrite.aw")
	public String edit(HttpServletRequest req,@RequestParam Map map,Model model) throws Exception{
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			BuySellDTO record = allBoardService.selectOne(map);
			//수정 폼으로 이동]
			model.addAttribute("record", record);
			return "market/edit/editSellWrite.tiles";
		}
		
		//수정처리후 메시지 뿌려주는 페이지(Message.jsp)로 이동
		int successFail = allBoardService.update(map);
		model.addAttribute("successFail", successFail);
		model.addAttribute("WHERE", "EDT");
		return "market/Message";
	}//////////////edit()
	
	//삭제 처리
	@RequestMapping("/market/delete.aw")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		int successFail = allBoardService.delete(map);
		model.addAttribute("successFail", successFail);
		return "market/Message";
	}//////////////delete()
		
	
	//Summernote 업로드 기능
	@ResponseBody
    @RequestMapping(value="/market/Upload.aw")
    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		MultipartFile upload = mhsr.getFile("file");
		
		String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFilename);
		upload.transferTo(file);
        return "/Upload/"+newFilename;
   }
	*/

	@RequestMapping("/market/{path}/sell.aw")
	public String inside(@PathVariable String path) throws Exception {
		return "market/" + path + "/inside.tiles";
	
	
	}////////// move
	
	
	
	
}//////////////////// MarketMainController
