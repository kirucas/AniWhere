package com.animal.aniwhere.web.board.animal.rna;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
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
public class RnAPhotoController {
	@Resource(name="photoService")
	private PhotoBoardServiceImpl service;
	
	@Value("${PHOTOPAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//등록 폼으로 이동]
	@RequestMapping(value="/security/rNa/photo/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/rNa/photo/photo_write.tiles";
	}/// write
	
	// 등록 완료 후 리스트로 이동
	@ResponseBody
	@RequestMapping(value="/security/rNa/photo/write.awa",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public void writeComplete(@RequestParam Map map,MultipartHttpServletRequest mhsr,HttpSession session) throws Exception{
		map.put("ani_category", 4);
		map.put("mem_no", session.getAttribute("mem_no"));
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("key:"+key+", value:"+map.get(key));
		// insert 부분
		service.insert(map);
		// 이 메소드만 부르면 될것	
		List<String> upFiles=AwsS3Utils.uploadFileToS3(mhsr,"rNa");
		for(String name:upFiles) {
			System.out.println(name);
		}/// for
		map.put("link_list", upFiles);
		service.linkInsert(map);
	}/// writeComplete

	@RequestMapping("/animal/rNa/photo.aw")
	public String list(@RequestParam Map map,@RequestParam(required=false,defaultValue="1") int nowPage,
			Model model,HttpServletRequest req) throws Exception {
		map.put("ani_category", 3);
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
			//System.out.println(map.get("no"));
			List<Map> linkList=service.linkSelectList(map); // 해당 no의 사진 리스트를 받고
			dto.setTotalImgCount(linkList.size()-1);
			for(Map temp:linkList) {
				//System.out.println(temp);
				Set<String> set=temp.keySet();
				temp.put("LINK", AwsS3Utils.LINK_ADDRESS+temp.get("LINK"));
				/*for(String key:set) {
					System.out.println("key:"+key+", value:"+temp.get(key));
				}/// for
*/			}/// for
			
			photoList.add(linkList); // 담는다
		}/// for
		model.addAttribute("photoList", photoList);
		
		// 페이징 문자열을 위한 로직 호출]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/animal/rNa/photo.aw?");
		// 데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		// 서버 시간 담기
		model.addAttribute("serverTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
		return "board/animal/rNa/photo/photo_list.tiles";
	}/// list
	
	@RequestMapping("/rNa/photo/delete.aw")
	public String delete(@RequestParam Map map) throws Exception {
		//System.out.println(map.get("no"));
		List<Map> linkList=service.linkSelectList(map);
		String[] key_names=new String[linkList.size()];
		int i=0;
		for(Map linkMap:linkList) {
			key_names[i]=linkMap.get("LINK").toString();
			i++;
		}
		service.linkDelete(map);
		service.delete(map);
		AwsS3Utils.deleteFileFromS3(key_names);
		AwsS3Utils.s3ReadObjects("rNa");
		return "forward:/animal/rNa/photo.aw";
	}/// delete
	
	@ResponseBody
	@RequestMapping(value="/rNa/photo/modalView.awa",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String modalView(@RequestParam Map map) throws Exception {
		//System.out.println("글번호 " +map.get("no"));
		List<Map> photoList=service.linkSelectList(map);
		for(Map photo:photoList)
			photo.put("LINK",AwsS3Utils.LINK_ADDRESS+photo.get("LINK"));
		//System.out.println("넘어가는녀석들"+JSONArray.toJSONString(photoList));
		return JSONArray.toJSONString(photoList);
	}/// modalView
	
	@ResponseBody
	@RequestMapping(value="/rNa/photo/modalContent.awa",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String modalContent(@RequestParam Map map,HttpSession session) throws Exception {
		//System.out.println("글번호 " +map.get("no"));
		PhotoBoardDTO dto=service.selectOne(map);
		JSONObject json=new JSONObject();
		json.put("user", session.getAttribute("mem_no"));
		json.put("mem_no",dto.getMem_no());
		json.put("mem_nickname",dto.getMem_nickname());
		json.put("photo_title", dto.getPhoto_title());
		json.put("photo_regidate",dto.getPhoto_regidate().toString());
		json.put("photo_content", dto.getPhoto_content());
		json.put("photo_hit",dto.getPhoto_hit());
		json.put("photo_count",dto.getPhoto_count());
		return json.toJSONString();
	}/// modalView
}//////////////////// PhotoController class