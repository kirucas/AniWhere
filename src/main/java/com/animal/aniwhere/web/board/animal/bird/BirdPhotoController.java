package com.animal.aniwhere.web.board.animal.bird;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.animal.MovieBoardDTO;
import com.animal.aniwhere.service.animal.PhotoBoardDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.animal.PhotoBoardServiceImpl;

@Controller
public class BirdPhotoController {
	@Resource(name="photoService")
	private PhotoBoardServiceImpl service;
	
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//등록 폼으로 이동]
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/bird/photo/photo_write.tiles";
	}/// write
	
	// 등록 완료 후 리스트로 이동
	@ResponseBody
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.POST)
	public void writeComplete(@RequestParam Map map,MultipartHttpServletRequest mhsr,HttpSession session) throws Exception{
		map.put("ani_category", 4);
		map.put("mem_no", session.getAttribute("mem_no"));
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("key:"+key+", value:"+map.get(key));
		// insert 부분
		map.put("no", service.insert(map));
		// 이 메소드만 부르면 될것	
		List<String> upFiles=AwsS3Utils.uploadFileToS3(mhsr,"bird");
		for(String name:upFiles) {
			//System.out.println(name);
			map.put("link_url", name);
			service.linkInsert(map);
		}/// for
	}/// writeComplete

	@RequestMapping("/animal/bird/photo.aw")
	public String list(@RequestParam Map map,@RequestParam(required=false,defaultValue="1") int nowPage,
			Model model,HttpServletRequest req) throws Exception {
		map.put("ani_category", 4);
		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		map.put("start",start);
		map.put("end",end);
		// 페이징을 위한 로직 끝]
		
		List<PhotoBoardDTO> list=service.selectList(map); // 전체 목록을 받아서
		List<List<Map>> photoList=new Vector<>(); // 전체 목록의 사진 리스트를 받을 리스트를 만들고
		for(PhotoBoardDTO dto:list) {
			map.put("no", dto.getNo()); // no를 뽑아서
			List<Map> linkList=service.linkSelectList(map); // 해당 no의 사진 리스트를 받고
			photoList.add(linkList); // 담는다
			for(Map temp:linkList) {
				System.out.println(temp);
				Set<String> set=temp.keySet();
				for(String key:set) {
					System.out.println("key:"+key+", value:"+temp.get(key));
				}/// for
			}/// for
		}/// for
		map.put("photoList", photoList);
		
		// 페이징 문자열을 위한 로직 호출]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/animal/bird/photo.aw?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "board/animal/bird/photo/photo_list.tiles";
	}/// list
}//////////////////// PhotoController class