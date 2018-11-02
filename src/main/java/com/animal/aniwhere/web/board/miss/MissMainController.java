package com.animal.aniwhere.web.board.miss;

import java.io.File;
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
import com.animal.aniwhere.service.impl.miss.FindSeeServiceImpl;
import com.animal.aniwhere.service.impl.miss.LostAnimalServiceImpl;
import com.animal.aniwhere.service.miss.FindSeeDTO;
import com.animal.aniwhere.service.miss.LostAnimalDTO;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class MissMainController {

	@Resource(name = "findSeeService")
	private FindSeeServiceImpl service;

	// 보호소 컨트롤러
	@Resource(name = "lostAniService")
	private LostAnimalServiceImpl lostservice;

	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;

	// miss_main 이동
	@RequestMapping("/miss/miss_main.aw")
	public String miss_main(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "1") int nowPage) throws Exception {

		map.put("table_name", "see");

		if (map.get("table_name") == "see") {
			// 전체 레코드 수
			int totalRecordCount = service.getTotalRecord(map);
			// 페이지 사이즈
			// 전체 페이지수]
			int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
			// 현재 페이지를 파라미터로 받기]
			// 시작 및 끝 ROWNUM구하기]
			int start = (nowPage - 1) * pageSize + 1;
			int end = nowPage * pageSize - 1;
			map.put("start", start);
			map.put("end", end);
			// 페이징을 위한 로직 끝]

			List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/miss_main.aw?");

			model.addAttribute("list", list);

			model.addAttribute("pagingString", pagingString);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);

		} /////////////////////////////////////////////////////////////////// 봤어요 리스트

		map.put("table_name", "find");

		if (map.get("table_name") == "find") {
			int totalRecordCount = service.getTotalRecord(map);
			// 페이지 사이즈
			// 전체 페이지수]
			int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
			// 현재 페이지를 파라미터로 받기]
			// 시작 및 끝 ROWNUM구하기]
			int start = (nowPage - 1) * pageSize + 1;
			int end = nowPage * pageSize - 1;
			map.put("start", start);
			map.put("end", end);
			// 페이징을 위한 로직 끝]

			List<FindSeeDTO> list2 = (List<FindSeeDTO>) service.selectList(map);

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/miss_main.aw?");

			model.addAttribute("list2", list2);

			model.addAttribute("pagingString", pagingString);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);

		} /////////////////////////////////////////////////////////////////// 찾아요 리스트

		// 전체 레코드 수
		int totalRecordCount = lostservice.getTotalRecord(map);
		// 페이지 사이즈
		// 전체 페이지수]
		int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
		// 현재 페이지를 파라미터로 받기]
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize - 2;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]

		List<LostAnimalDTO> list3 = (List<LostAnimalDTO>) lostservice.selectList(map);

		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/miss/shelter.aw?");

		model.addAttribute("list3", list3);

		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		///////////////////////////////////////////////////////////////////// 보호소 리스트

		return "miss/miss_main.tiles";
	}////////// miss_main

	// see or find 메인으로 이동
	@RequestMapping("/miss/{path}")
	public String move_board(@PathVariable String path) throws Exception {
		return "miss/" + path + "/" + path + "_main.tiles";
	}////////// move_board/miss/find.aw

	// _main -> _write로 이동
	@RequestMapping("/miss/{path}_write.aw")
	public String miss_write(@PathVariable String path) throws Exception {
		return "miss/" + path + "/" + path + "_write.tiles";
	}////////// miss_write

	// ========================================================================================

	// 입력 후 리스트로 이동
	@RequestMapping("/security/miss/see_insert.aw")
	public String miss_insert(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		service.insert(map);
		return "forward:/miss/see.aw";
	}////////// miss_write

	// 리스트로 이동
	@RequestMapping("/miss/see.aw")
	public String see_list(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "1") int nowPage) throws Exception {

		map.put("table_name", "see");

		/*
		 * Set<String> set = map.keySet(); for(String key:set) {
		 * System.out.println(key+":"+map.get(key)); }
		 */

		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		// 페이지 사이즈
		// 전체 페이지수]
		int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
		// 현재 페이지를 파라미터로 받기]
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]

		List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);

		List<Map> collect = new Vector<>();

		for (FindSeeDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name", "see");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtService.commentCount(temp));

			collect.add(record);
		}

		if (map.get("searchWord") != null) {
			String searchWord = map.get("searchWord").toString();
			String searchColumn = map.get("searchColumn").toString();

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/see.aw?searchColumn=" + searchColumn + "&searchWord=" + searchWord
							+ "&");

			model.addAttribute("pagingString", pagingString);
		}

		else {
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/see.aw?");
			model.addAttribute("pagingString", pagingString);
		}

		// model.addAttribute("see_list", list);
		model.addAttribute("see_list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		return "miss/see/see_main.tiles";
	}////////// miss_write

	// 상세보기
	@RequestMapping("/miss/see_view.aw")
	public String see_view(@RequestParam Map map, Model model, HttpSession session) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "see");
		map.put("no", map.get("see_no"));

		// 게시글
		FindSeeDTO record = service.selectOne(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		// 줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));

		record.setCount(record.getCount());
		// 뷰정보 반환]
		return "miss/see/see_view.tiles";
	}////////// miss_view

	// 수정폼 이동
	@RequestMapping("/security/miss/see_edit.aw")
	public String miss_edit(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req)
			throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "see");
		map.put("no", map.get("see_no"));

		// 게시글
		FindSeeDTO record = service.selectOne(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		// 줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));

		return "miss/see/see_edit.tiles";
	}////////// miss_write

	// 수정
	@RequestMapping("/security/miss/see_update.aw")
	public String miss_update(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "see");
		map.put("no", map.get("see_no"));

		/*
		 * Set<String> set = map.keySet(); for(String key:set) {
		 * System.out.println(key+":"+map.get(key)); }
		 */
		// 게시글
		service.update(map);

		return "forward:/miss/see_view.aw";
	}////////// miss_write

	// 삭제
	@RequestMapping("/miss/see_delete.aw")
	public String miss_delete(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "see");
		map.put("no", map.get("see_no"));

		service.delete(map);

		return "forward:/miss/see.aw";
	}////////// miss_write

	@ResponseBody
	@RequestMapping(value = "/miss/see_upload/Upload.aw")
	public String imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		// String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		// MultipartFile upload = mhsr.getFile("file");
		// String newFilename = FileUpDownUtils.getNewFileName(phisicalPath,
		// upload.getOriginalFilename());
		// File file = new File(phisicalPath+File.separator+newFilename);
		// upload.transferTo(file);

		List<String> uploadList = AwsS3Utils.uploadFileToS3(mhsr, "see"); // S3 업로드

		// return "/Upload/"+newFilename;
		return AwsS3Utils.LINK_ADDRESS + uploadList.get(0);
	}

	// ================================================================================================================

	// 입력 후 리스트로 이동
	@RequestMapping("/security/miss/find_insert.aw")
	public String find_insert(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("addr", map.get("addr"));

		service.insert(map);

		return "forward:/miss/find.aw";
	}////////// miss_write

	// 리스트로 이동
	@RequestMapping("/miss/find.aw")
	public String find_list(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "1") int nowPage) throws Exception {

		map.put("table_name", "find");

		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		// 페이지 사이즈
		// 전체 페이지수]
		int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
		// 현재 페이지를 파라미터로 받기]
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]

		List<FindSeeDTO> list = (List<FindSeeDTO>) service.selectList(map);

		List<Map> collect = new Vector<>();

		for (FindSeeDTO dto : list) {
			Map record = new HashMap();
			record.put("dto", dto);
			Map temp = new HashMap();
			temp.put("table_name", "find");
			temp.put("no", dto.getNo());
			record.put("cmtCount", cmtService.commentCount(temp));

			collect.add(record);
		}

		if (map.get("searchWord") != null) {
			String searchWord = map.get("searchWord").toString();
			String searchColumn = map.get("searchColumn").toString();

			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/find.aw?searchColumn=" + searchColumn + "&searchWord=" + searchWord
							+ "&");

			model.addAttribute("pagingString", pagingString);
		}

		else {
			String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
					req.getContextPath() + "/miss/find.aw?");
			model.addAttribute("pagingString", pagingString);
		}

		// model.addAttribute("find_list", list);
		model.addAttribute("find_list", collect);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		return "miss/find/find_main.tiles";
	}////////// miss_write

	// 상세보기
	@RequestMapping("/miss/find_view.aw")
	public String find_view(@RequestParam Map map, Model model, HttpSession session) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "find");
		map.put("no", map.get("find_no"));

		// 게시글
		FindSeeDTO record = service.selectOne(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		// 줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));
		// 조회수 증가
		record.setCount(record.getCount());

		// 뷰정보 반환]
		return "miss/find/find_view.tiles";
	}////////// miss_view

	// 수정폼 이동
	@RequestMapping("/security/miss/find_edit.aw")
	public String find_edit(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req)
			throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "find");
		map.put("no", map.get("find_no"));

		// 게시글
		FindSeeDTO record = service.selectOne(map);
		// 데이터 저장]
		model.addAttribute("record", record);
		// 줄바꿈처리
		record.setContent(record.getContent().replace("\r\n", "<br/>"));

		return "miss/find/find_edit.tiles";
	}////////// miss_write

	// 수정
	@RequestMapping("/security/miss/find_update.aw")
	public String find_update(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "find");
		map.put("no", map.get("find_no"));

		/*
		 * Set<String> set = map.keySet(); for(String key:set) {
		 * System.out.println(key+":"+map.get(key)); }
		 */
		// 게시글
		service.update(map);

		return "forward:/miss/find_view.aw";
	}////////// miss_write

	// 삭제
	@RequestMapping("/miss/find/find_delete.aw")
	public String find_delete(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "find");
		map.put("no", map.get("find_no"));

		service.delete(map);

		return "forward:/miss/find.aw";
	}////////// miss_write

	@ResponseBody
	@RequestMapping(value = "/miss/find_upload/Upload.aw")
	public String find_imageUpload(MultipartHttpServletRequest mhsr) throws Exception {
		// String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		// MultipartFile upload = mhsr.getFile("file");
		// String newFilename = FileUpDownUtils.getNewFileName(phisicalPath,
		// upload.getOriginalFilename());
		// File file = new File(phisicalPath+File.separator+newFilename);
		// upload.transferTo(file);

		List<String> uploadList = AwsS3Utils.uploadFileToS3(mhsr, "find"); // S3 업로드

		// return "/Upload/"+newFilename;
		return AwsS3Utils.LINK_ADDRESS + uploadList.get(0);
	}

	// ================================================================================================================

	// 리스트로 이동
	@RequestMapping("/miss/shelter.aw")
	public String lost_main(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "1") int nowPage) throws Exception {

		// 전체 레코드 수
		int totalRecordCount = lostservice.getTotalRecord(map);
		// 페이지 사이즈
		// 전체 페이지수]
		int totalPage = (int) Math.ceil(((double) totalRecordCount / pageSize));
		// 현재 페이지를 파라미터로 받기]
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize - 1;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]

		List<LostAnimalDTO> list = (List<LostAnimalDTO>) lostservice.selectList(map);

		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/miss/shelter.aw?");

		model.addAttribute("list", list);

		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		return "miss/shelter/shelter_main.tiles";
	}////////// miss_write

	// 상세보기
	@RequestMapping("/miss/shelter_view.aw")
	public String shelter_view(@RequestParam Map map, Model model, HttpSession session) throws Exception {

		map.put("no", map.get("shelter_no"));

		// 게시글
		LostAnimalDTO record = lostservice.selectOne(map);
		// 데이터 저장]
		model.addAttribute("record", record);

		// 뷰정보 반환]
		return "miss/shelter/shelter_view.tiles";
	}////////// miss_view

	// ---------------------------------------------------------------------------------------------------------------------------------

	// see
	// 서비스 주입
	@Resource(name = "allCommentService")
	private AllCommentServiceImpl cmtService;

	@ResponseBody
	@RequestMapping(value = "/miss/see/cmt_write.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String write(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "see");
		map.put("no", map.get("no"));

		cmtService.insert(map);

		return map.get("no").toString();

	}///////////////////

	@ResponseBody
	@RequestMapping(value = "/miss/see/cmt_list.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String list(@RequestParam Map map, HttpSession model) throws Exception {

		map.put("table_name", "see");
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
	@RequestMapping(value = "/miss/see/cmt_edit.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String update(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "see");
		map.put("cmt_content", map.get("cmt_content"));
		map.put("cmt_no", session.getAttribute("cmt_no"));

		Set<String> set = map.keySet();
		for (String key : set) {
			System.out.println(key + ":" + map.get(key));
		}

		cmtService.update(map);

		return map.get("no").toString();
	}////////////

	@ResponseBody
	@RequestMapping(value = "/miss/see/cmt_delete.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String delete(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "see");
		map.put("cmt_no", session.getAttribute("cmt_no"));

		cmtService.delete(map);

		return map.get("no").toString();
	}

	// find

	@ResponseBody
	@RequestMapping(value = "/miss/find/cmt_write.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String find_write(@RequestParam Map map, HttpSession session, Model model) throws Exception {

		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("table_name", "find");
		map.put("no", map.get("no"));

		cmtService.insert(map);

		return map.get("no").toString();

	}///////////////////

	@ResponseBody
	@RequestMapping(value = "/miss/find/cmt_list.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String find_list(@RequestParam Map map, HttpSession model) throws Exception {

		map.put("table_name", "find");
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
	@RequestMapping(value = "/miss/find/cmt_edit.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String find_update(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "find");
		map.put("cmt_content", map.get("cmt_content"));
		map.put("cmt_no", session.getAttribute("cmt_no"));
		/*
		 * Set<String> set = map.keySet(); for(String key:set) {
		 * System.out.println(key+":"+map.get(key)); }
		 */
		cmtService.update(map);

		return map.get("no").toString();
	}////////////

	@ResponseBody
	@RequestMapping(value = "/miss/find/cmt_delete.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String find_delete(@RequestParam Map map, HttpSession session) throws Exception {

		map.put("table_name", "find");
		map.put("cmt_no", session.getAttribute("cmt_no"));

		cmtService.delete(map);

		return map.get("no").toString();
	}

	// 안드로이드=======================================
	@ResponseBody
	@RequestMapping(value = "/miss/AndroidFindSeeList.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String find_list(@RequestParam Map map) throws Exception {
		System.out.println("/miss/AndroidFindSeeList.awa");
		if (map.get("kind").equals("찾아요")) {
			map.put("table_name", "find");
		} else {
			map.put("table_name", "see");
		}

		// 전체 레코드 수
		int totalRecordCount = service.getTotalRecord(map);
		map.put("start", 1);
		map.put("end", totalRecordCount);
		List<FindSeeDTO> lists = (List<FindSeeDTO>) service.selectList(map);
		List<Map> collections = new Vector<Map>();

		for (FindSeeDTO list : lists) {
			Map record = new HashMap();
			record.put("no", list.getNo());
			record.put("mem_no", list.getMem_no());
			record.put("title", list.getTitle());
			record.put("content", list.getContent().replaceAll("<br/>", "\r\n"));
			record.put("regidate", list.getRegidate() + "");
			record.put("count", list.getCount());
			record.put("animal_code", list.getAnimal_code());
			record.put("mem_nickname", list.getMem_nickname());
			record.put("animal_name", list.getAnimal_name());
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}//////////

	@ResponseBody
	@RequestMapping(value = "/miss/AndroidCommentFindSeeList.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String androidFindList(@RequestParam Map map) throws Exception {
		System.out.println("/miss/AndroidCommentFindSeeList.awa");
		if (map.get("kind").equals("찾아요")) {
			map.put("table_name", "find");
		} else {
			map.put("table_name", "see");
		}
		map.put("origin_no", map.get("no"));

		System.out.println("origin_no" + map.get("origin_no"));

		List<AllCommentDTO> collections = cmtService.selectList(map);

		List<Map> comments = new Vector<>();

		for (AllCommentDTO dto : collections) {

			Map record = new HashMap();
			record.put("cmt_no", dto.getCmt_no());
			record.put("cmt_content", dto.getCmt_content().replaceAll("<br/>", "\r\n"));
			record.put("mem_nickname", dto.getMem_nickname());
			record.put("regidate", dto.getRegidate().toString());
			record.put("origin_no", dto.getOrigin_no());
			record.put("mem_no", dto.getMem_no());
			record.put("hit", dto.getHit());

			comments.add(record);
		}
		System.out.println(JSONArray.toJSONString(comments));
		return JSONArray.toJSONString(comments);
	}

	@ResponseBody
	@RequestMapping(value = "/android/FindSee/CommentWrite.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String androidWrite(@RequestParam Map map, HttpSession session, Model model) throws Exception {
		System.out.println("======/android/FindSee/CommentWrite.awa=======");
		
		System.out.println(map.get("cmt_content").toString());
		System.out.println(map.get("no").toString());
		System.out.println(map.get("mem_no").toString());
		
		if (map.get("kind").equals("봤어요")) {
			map.put("table_name", "see");
		} else {
			map.put("table_name", "find");
		}
		cmtService.insert(map);
		System.out.println("333333333333");
		return "true";
	}///////////////////
	
	@ResponseBody
	@RequestMapping(value="/miss/androidFindSeeInsertImage.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String androidinsertImage(MultipartHttpServletRequest mhsr) throws Exception {
		
		System.out.println("androidFindSeeInsertImage");
		List<String> lists = AwsS3Utils.uploadFileToS3(mhsr, "FindSee");//리턴 파일 개수
		String path = AwsS3Utils.LINK_ADDRESS+lists.get(0);
		return path;
	}//////////
	
	@ResponseBody
	@RequestMapping(value="/miss/androidFindSeeInsert.awa", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
	public String androidinsert(@RequestParam Map map) throws Exception {
		System.out.println("/miss/androidFindSeeInsert.awa");
		map.put("addr", map.get("addr").toString());
		
		System.out.println(map.get("mem_no"));
		System.out.println(map.get("title"));
		System.out.println(map.get("content"));
		System.out.println(map.get("addr"));
		System.out.println(map.get("animal_code"));
		
		
		if (map.get("kind").equals("봤어요")) {
			map.put("table_name", "see");
		} else {
			map.put("table_name", "find");
		}
		service.insert(map);
		return "true";
	}//////////

}//////////////////// MissMainController class
