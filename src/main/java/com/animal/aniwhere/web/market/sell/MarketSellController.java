package com.animal.aniwhere.web.market.sell;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.market.BuySellServiceImpl;
import com.animal.aniwhere.service.market.BuySellDTO;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class MarketSellController {

	 //buy컨트롤러 
		@Resource(name="buySellService")
		private BuySellServiceImpl allBoardService;
		
		@Value("${PAGESIZE}")
		private int pageSize;
		@Value("${BLOCKPAGE}")
		private int blockPage;

	@RequestMapping("/market/{path}/sell.aw")
	public String inside(@PathVariable String path) throws Exception {
		return "market/" + path + "/inside.tiles";
	
	
	}////////// move
	
	//입력 후 리스트로 이동 
			@RequestMapping("/security/market/sellinsert.aw")
			public String miss_insert(@RequestParam Map map,HttpSession session) throws Exception {
				
				map.put("table_name","sell");
				map.put("mem_no", session.getAttribute("mem_no"));			
				allBoardService.insert(map);				
				return "redirect:/market/sell/temporarily.aw";
				
			}////////// miss_write
			
			
			@RequestMapping("/market/sell/temporarily.aw")
			public String market_list(Model model,
					HttpServletRequest req,//페이징용 메소드에 전달
					@RequestParam Map map,//검색용 파라미터 받기
					@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
					)throws Exception {
				//서비스 호출]
				//페이징을 위한 로직 시작]
				map.put("table_name","sell");
				//전체 레코드 수
			
				int totalRecordCount= allBoardService.getTotalRecord(map);
				//전체 페이지수]
				int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
						
				//시작 및 끝 ROWNUM구하기]
				int start = (nowPage-1)*pageSize+1;
				int end   = nowPage*pageSize;
				map.put("start",start);
				map.put("end",end);
				
				//시험용
				Set<String> set = map.keySet();
				for(String key:set) {
					System.out.println(key+":"+map.get(key));}
						
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
			public String buyinside(@RequestParam Map map,Model model,HttpSession session) throws Exception {
				
				map.put("mem_no",session.getAttribute("mem_no"));
				map.put("table_name","sell");
				map.put("no", map.get("sell_no"));
					
				//서비스 호출]
				System.out.println("====================1");
			//	System.out.println(map.get("no").toString());
				
				//게시글
				BuySellDTO record = allBoardService.selectOne(map);
				
				//테스트용 
				System.out.println("====================2");
				//데이터 저장]
				model.addAttribute("record", record);
				//줄바꿈처리
				record.setContent(record.getContent().replace("\r\n", "<br/>")); //???
				//뷰정보 반환]
				
				return //"forward:/market/"+path+"/temporarily.aw"
		   				"market/inside/sellinside.tiles";
				       
				
			}////////// buyinside
			
			//write 입력처리]
			@RequestMapping(value="/market/SellWrite.aw",method=RequestMethod.GET)
			public String write() throws Exception{
				return "market/write/SellWrite.tiles";
			}////////////////
			
			// 쓰기에서 db에올리고 목록으로 이동 ]
			@RequestMapping(value="/security/market/SellWrite.aw",method=RequestMethod.POST)
			public String writeOk(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
				
				
				
				map.put("mem_no", session.getAttribute("mem_no"));
				map.put("table_name","sell");
				//map.put("no", map.get("buy_no"));
				
				/*//키값 확인ㅇ
				Set<String> set=map.keySet();
				for(String key:set) {
					System.out.println("key:"+key+", value:"+map.get(key));
				}*/
				
				//서비스 호출
				//작성자의 id를 DTO에 설정
				//스프링 시큐리티 적용 전
				
				//System.out.println("인증된 사용자:"+auth.getPrincipal());
				//UserDetails authenticatedUser = (UserDetails) auth.getPrincipal();
				//System.out.println("아이디 : "+authenticatedUser.getUsername());
				//System.out.println("비밀번호 : "+authenticatedUser.getPassword());
				//System.out.println("권한:"+authenticatedUser.getAuthorities().toString());
				//스프링 시큐리티적용 후
				//map.put("id", authenticatedUser.getUsername());
				
				//게시글
				allBoardService.insert(map);
				/*BuySellDTO record = allBoardService.selectOne(map);
				//데이터 저장]
			    model.addAttribute("record", record);
				//줄바꿈처리
				record.setContent(record.getContent().replace("\r\n", "<br/>"));*/

				//뷰정보반환:목록으로 이동
				//return "market/buy/temporarily.tiles";//접두어 접미어 설정 적용 안되게끔 하려고 forward:를 붙임
				return "forward:/market/sell/temporarily.aw";
				
			}////////////////
			
			
			//수정폼 이동 --자기아이디로 자기글 view에서 수정 누르면 이쪽으로 이동 
			@RequestMapping("/security/market/selledit.aw")
			public String find_edit(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
					
				map.put("mem_no",session.getAttribute("mem_no"));
				map.put("table_name","sell");
				map.put("no", map.get("sell_no"));
				
				//게시글
				BuySellDTO record = allBoardService.selectOne(map);
				//데이터 저장]
				model.addAttribute("record", record);
				//줄바꿈처리
				record.setContent(record.getContent().replace("\r\n", "<br/>"));
				
				return "market/edit/editSellWrite.tiles";
				
			}////////// miss_write
			
			//수정 실행하기
			@RequestMapping("/security/market/sellupdate.aw")
			public String edit(@RequestParam Map map,Model model,HttpSession session) throws Exception{
				map.put("mem_no",session.getAttribute("mem_no"));
				map.put("table_name","sell");
				map.put("no",map.get("sell_no"));
				
				allBoardService.update(map);
				
				return "redirect:/market/sell.aw";//buy목록으로 이동
			}//////////////edit()
			
			
			//삭제 처리
			@RequestMapping("/market/sell/delete.aw")
			public String delete(@RequestParam Map map,Model model,HttpSession session) throws Exception{
				map.put("mem_no",session.getAttribute("mem_no"));
				map.put("table_name","sell");
				map.put("no",map.get("sell_no"));
					
				allBoardService.delete(map);
				
				/*
				int successFail = allBoardService.delete(map);
				model.addAttribute("successFail", successFail);
				*/
				
				return "forward:/market/sell.aw";
			}//////////////delete()
			
			
			//Summernote 업로드 기능
			@ResponseBody
		    @RequestMapping(value="/market/sell/Upload.aw")
			
		    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
				System.out.println("들어옴");
				
				String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
				MultipartFile upload = mhsr.getFile("file");
				
				String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
				File file = new File(phisicalPath+File.separator+newFilename);
				
				if(!file.exists()) {
					file.mkdirs();		
				}
				
				upload.transferTo(file);
		        return "/Upload/"+newFilename;
		   }
	
	
	
}//////////////////// MarketMainController
