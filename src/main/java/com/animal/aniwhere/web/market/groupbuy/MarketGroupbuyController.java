package com.animal.aniwhere.web.market.groupbuy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
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

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.impl.AllCommentServiceImpl;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.market.GroupBuyServiceImpl;
import com.animal.aniwhere.service.impl.market.GroupBuyingListServiceImpl;
import com.animal.aniwhere.service.market.BuySellDTO;
import com.animal.aniwhere.service.market.GroupBuyDTO;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class MarketGroupbuyController {
			
	
		 //buy컨트롤러 
			@Resource(name="groupBuyService")
			private GroupBuyServiceImpl allBoardService;
			        
			@Value("${PAGESIZE}")
			private int pageSize;
			@Value("${BLOCKPAGE}")
			private int blockPage;
      //
		@RequestMapping("/market/{path}/groupbuy.aw")
		public String inside(@PathVariable String path) throws Exception {
			return "market/" + path + "/inside.tiles";
		
		
		}////////// move
		
		//입력 후 리스트로 이동 
		@RequestMapping("/security/market/groupbuyinsert.aw")
		public String groupbuy_insert(@RequestParam Map map,HttpSession session) throws Exception {
			
			System.out.println("deadline"+ map.get("deadline"));
			
			map.put("table_name","group_buy");
			map.put("mem_no", session.getAttribute("mem_no"));			
			allBoardService.insert(map);
			
			System.out.println("끝까지 오는지 확인 ");
			
			return "redirect:/market/groupbuy/temporarily.aw";
			
		}////////// groupbuy_write
				
				
				@RequestMapping("/market/groupbuy/temporarily.aw")
				public String market_list(Model model,
						HttpServletRequest req,//페이징용 메소드에 전달
						@RequestParam Map map,//검색용 파라미터 받기
						@RequestParam(required=false,defaultValue="1") int nowPage//페이징용 nowPage파라미터 받기용
						)throws Exception {
					//서비스 호출]
					//페이징을 위한 로직 시작]
					map.put("table_name","group_buy");
					//전체 레코드 수
				
					int totalRecordCount= allBoardService.getTotalRecord(map);
					//전체 페이지수]
					int totalPage = (int)Math.ceil(((double)totalRecordCount/pageSize));
							
					//시작 및 끝 ROWNUM구하기]
					int start = (nowPage-1)*pageSize+1;
					int end   = nowPage*pageSize;
					map.put("start",start);
					map.put("end",end);
					
					
					
					//페이징을 위한 로직 끝]
					List<GroupBuyDTO> list = (List<GroupBuyDTO>) allBoardService.selectList(map);
					//페이징 문자열을 위한 로직 호출]
					 List<Map> collect = new Vector<>();
					 
					 for(GroupBuyDTO dto : list) {
				         Map record = new HashMap();
				         record.put("dto", dto);
				         Map temp = new HashMap();
				         temp.put("table_name","group_buy");
				         temp.put("no", dto.getNo());
				         
				         
				         record.put("cmtCount", cmtService.commentCount(temp));
				         
				         collect.add(record);
				         
				      }
					 
					//페이징 문자열을 위한 로직 호출]
					 if(map.get("searchWord") != null) {
				         String searchWord = map.get("searchWord").toString();   
				         String searchColumn = map.get("searchColumn").toString();   

				         String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
				               req.getContextPath()+"/market/groupbuy.aw?searchColumn="+searchColumn+"&searchWord="+searchWord+"&");
				         
				         model.addAttribute("pagingString", pagingString);
				      }
				      
				      else {
				         String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage,nowPage,
				               req.getContextPath()+"/market/groupbuy.aw?");
				         model.addAttribute("pagingString", pagingString);
				      }
					 
					
					model.addAttribute("list", collect);
					model.addAttribute("totalRecordCount", totalRecordCount);
					 model.addAttribute("nowPage", nowPage);
				     model.addAttribute("pageSize", pageSize);
					//뷰정보 반환]
				
					return "market/groupbuy/temporarily.tiles";
					
				}////////// market_main
				
		
				//상세보기
				@RequestMapping("/groupbuy/groupbuyinside.aw")
				public String buyinside(@RequestParam Map map,Model model,HttpSession session) throws Exception {
					
					map.put("mem_no",session.getAttribute("mem_no"));
					map.put("table_name","group_buy");
					map.put("no", map.get("buy_no"));
						
					//서비스 호출]
				
					
					//게시글
					GroupBuyDTO record = allBoardService.selectOne(map);
					
					//줄바꿈처리
					record.setContent(record.getContent().replace("\r\n", "<br/>")); //???
					//데이터 저장]
					model.addAttribute("record", record);
					System.out.println("content"+record.getContent());
					//뷰정보 반환]
					
					return //"forward:/market/"+path+"/temporarily.aw"
			   				"market/inside/groupbuyinside.tiles";
					
				}////////// buyinside
				
				//write 입력처리]
				@RequestMapping(value="/market/GroupBuyWrite.aw",method=RequestMethod.GET)
				public String write() throws Exception{
					return "market/write/GroupBuyWrite.tiles";
				}////////////////
				
				// 쓰기에서 db에올리고 목록으로 이동 ]
				@RequestMapping(value="/security/market/GroupBuyWrite.aw",method=RequestMethod.POST)
				public String writeOk(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
					
					
					
					map.put("mem_no", session.getAttribute("mem_no"));
					map.put("table_name","group_buy");
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
					return "forward:/market/groupbuy/temporarily.aw";
					
				}////////////////
				
				
				//수정폼 이동 --자기아이디로 자기글 view에서 수정 누르면 이쪽으로 이동 
				@RequestMapping("/security/market/groupbuyedit.aw")
				public String groupbuy_edit(@RequestParam Map map,HttpSession session,Model model,HttpServletRequest req) throws Exception {
						
					map.put("mem_no",session.getAttribute("mem_no"));
					map.put("table_name","group_buy");
					map.put("no", map.get("buy_no"));
					
					//게시글
					GroupBuyDTO record = allBoardService.selectOne(map);
					//데이터 저장]
					model.addAttribute("record", record);
					//줄바꿈처리
					record.setContent(record.getContent().replace("\r\n", "<br/>"));
					
					return "market/edit/editGroupBuyWrite.tiles";
					
				}////////// groupbuy_write
				
				//수정 실행하기
				@RequestMapping("/security/market/groupbuyupdate.aw")
				public String edit(@RequestParam Map map,Model model,HttpSession session) throws Exception{
					map.put("mem_no",session.getAttribute("mem_no"));
					map.put("table_name","group_buy");
					map.put("no",map.get("buy_no"));
					
					allBoardService.update(map);
					
					return "redirect:/market/groupbuy.aw";//buy목록으로 이동
				}//////////////edit()
				
				
				//삭제 처리
				@RequestMapping("/market/groupbuy/delete.aw")
				public String delete(@RequestParam Map map,Model model,HttpSession session) throws Exception{
					map.put("mem_no",session.getAttribute("mem_no"));
					map.put("table_name","group_buy");
					map.put("no",map.get("buy_no"));
						
					allBoardService.delete(map);
					
					/*
					int successFail = allBoardService.delete(map);
					model.addAttribute("successFail", successFail);
					*/
					
					return "forward:/market/groupbuy.aw";
				}//////////////delete()
				
				//Summernote 업로드 기능
				@ResponseBody
			    @RequestMapping(value="/market/groupbuy/Upload.aw")
			    public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
					String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
					MultipartFile upload = mhsr.getFile("file");
					String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
					//File file = new File(phisicalPath+File.separator+newFilename);
					//upload.transferTo(file);
					
					List<String> uploadList=AwsS3Utils.uploadFileToS3(mhsr, "groupbuy"); // S3  업로드
					
			        //return "/Upload/"+newFilename;
					return AwsS3Utils.LINK_ADDRESS+uploadList.get(0);
			   }
				
			////여기서부터는 댓글 controller				
				@Resource(name="allCommentService")
				   private AllCommentServiceImpl cmtService;
				
				   @ResponseBody
				   @RequestMapping(value="/groupbuy/groupbuy/cmt_write.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
				   public String write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
				      
				      map.put("mem_no", session.getAttribute("mem_no"));
				      map.put("table_name", "group_buy");
				      map.put("no", map.get("no"));
				      
				      cmtService.insert(map);
				      
				      return map.get("no").toString();
				      
				   }///////////////////

				   
				   @ResponseBody
				      @RequestMapping(value="/market/groupbuy/cmt_write.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
				      public String buy_write(@RequestParam Map map,HttpSession session,Model model) throws Exception{
				         
				         map.put("mem_no", session.getAttribute("mem_no"));
				         map.put("table_name", "group_buy");
				         map.put("no", map.get("no"));
				         
				         cmtService.insert(map);
				         
				         return map.get("no").toString();
				         
				      }///////////////////
				   
				   @ResponseBody
				      @RequestMapping(value="/market/groupbuy/cmt_list.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
				      public String buy_list(@RequestParam Map map,HttpSession model) throws Exception{
				         
				         map.put("table_name", "group_buy");
				         map.put("origin_no", map.get("no"));
				         
				         List<AllCommentDTO> collections = cmtService.selectList(map);
				         
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
				      @RequestMapping(value="/market/groupbuy/cmt_edit.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
				      public String buy_update(@RequestParam Map map,HttpSession session) throws Exception{
				         
				         map.put("table_name", "group_buy");
				         map.put("cmt_content", map.get("cmt_content"));
				       
				         
				         //System.out.println("dddd1");
				         /*
				         Set<String> set = map.keySet();
				         for(String key:set) {
				            System.out.println(key+":"+map.get(key));
				         }
				         */
				         //System.out.println("dddd2");
				         				         
				         cmtService.update(map);
				         
				         return map.get("no").toString();
				      }////////////
				   			   
				   @ResponseBody
				   @RequestMapping(value="/market/groupbuy/cmt_delete.awa",produces="text/html; charset=UTF-8",method = RequestMethod.POST)
				   public String buy_delete(@RequestParam Map map,HttpSession session) throws Exception{
				         
				       map.put("table_name", "group_buy");
				       //map.put("cmt_no", session.getAttribute("cmt_no"));
				         
				       cmtService.delete(map);
				         
				       return map.get("no").toString();
				   }
		
		
		
	}//////////////////// MarketMainController

	
