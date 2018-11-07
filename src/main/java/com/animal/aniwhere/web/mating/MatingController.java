package com.animal.aniwhere.web.mating;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.impl.DraftingServiceImpl;
import com.animal.aniwhere.service.impl.MatingServiceImpl;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;
import com.animal.aniwhere.service.member.AnimalDTO;

@Controller
public class MatingController {
	@Resource(name="matingService")
	private MatingServiceImpl matingService;
	@Resource(name="animalService")
	private AnimalServiceImpl animalService;
	@Resource(name="draftingService")
	private DraftingServiceImpl draftService;

	@RequestMapping("/security/mating/main.aw")
	public String mating_main(HttpSession session) throws Exception {
		Map map=new HashMap<>();
		map.put("mem_no", session.getAttribute("mem_no"));
		if(matingService.selectMyMating(map).size()==0) {
			return "mating/matingMain.tiles";
		}
		return  "forward:/security/mating/Login.aw";
	}////////// mating_main

	@RequestMapping("/mating/matingProfile.aw")
	public String mating_profile() throws Exception {
		
		return "mating/matingProfile.tiles";
	}

	@RequestMapping("/security/mating/Login.aw")
	public String mating_login(@RequestParam Map map,HttpSession session,HttpServletResponse response) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		// 동물 등록이 되어있는지 확인하기
		if(animalService.getTotalRecord(map)==0) { // 등록된 동물이 없는 경우
			//System.out.println("동물 등록 페이지로 이동");
			// 동물 등록 페이지로 이동합니다
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 애완동물이 없어 등록 페이지로 갑니다.');</script>");
			out.flush();
			return "forward:/member_info.aw";
		} else {
			// 등록된 동물은 있으니까 
			return "forward:/mating/RegiList.aw";
		}/// if
	}/// mating_login
	
	
	@RequestMapping("/mating/RegiList.aw")
	public String mating_regist(HttpSession session,Map map) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		List<AnimalDTO> list=animalService.selectList(map);
		List<AnimalDTO> matingList=matingService.selectMyMating(map);
		map.put("anirecord",list);
		map.put("matingrecord",matingList);
		return "mating/matingRegiList.tiles";
	}
	
	// 메소드로 뽑자 동물번호/유저번호로 메이팅넘버 뽑기
	public String getMatingNoToAniNo(Map map,HttpSession session) {
		AnimalDTO animal=animalService.selectOne(map);
		// 현재 신청중인 동물 메이팅 넘버 얻어오기
		map.put("mem_no", session.getAttribute("mem_no"));
		map.put("ani_species",animal.getAni_species());
		map.put("ani_gender",animal.getAni_gender());
		map.put("ani_kind",animal.getAni_kind());
		map.put("start", 1);
		map.put("end", matingService.getTotalRecord(map));
		List<MatingDTO> list=matingService.selectList(map); // 그 동물이 속한 그룹을 메이팅에서 얻어옴
		String matingNo=null;
		for(MatingDTO dto:list) {
			if(dto.getAni_no().equals(animal.getAni_no())) {
				matingNo=dto.getMating_no(); // 그걸 토대로 같은 동물번호인 메이팅을 얻어옴
				break;
			}
		}
		return matingNo;
	}/// getMatingNoToAniNo

	@RequestMapping("/mating/Match.aw")
	public String mating_match(@RequestParam Map map,Model model,HttpSession session) throws Exception {
		map.put("ani_no", map.get("ani_no").toString().replace("matching", ""));
		AnimalDTO animal=animalService.selectOne(map);
		// 현재 신청중인 동물 메이팅 넘버 얻어오기
		String matingNo=getMatingNoToAniNo(map,session);
		map.put("ani_gender", animal.getAni_gender().equals("M")?"F":animal.getAni_gender().equals("F")?"M":"U");
		map.put("ani_species",animal.getAni_species());
		System.out.println("map.get(\"ani_kind\"):"+map.get("ani_kind"));
		if(!(animal.getAni_species().equals("3") || animal.getAni_species().equals("5")))
			map.remove("ani_kind");
		// 임시
		map.put("start",1);
		map.put("end",matingService.getTotalRecord(map));
		List<MatingDTO> matingList=matingService.selectList(map);
		for(int i=0;i<matingList.size();i++) {
			if(matingList.get(i).getMem_no().equals(session.getAttribute("mem_no"))){
				matingList.remove(i);
			}
		}/// for
		
		map.put("mating_no", matingNo);
		map.put("sending", true);
		List<Map> draftMap=draftService.selectList(map);
		String draftString="";
		for(Map temp:draftMap) {
			draftString+=temp.get("RECEIVE_NO")+",";
		}/// for
		
		model.addAttribute("matingNo",matingNo);
		model.addAttribute("animal",animal);
		model.addAttribute("list",matingList);
		model.addAttribute("draftString",draftString);
		return "mating/matingMatch.tiles";
	}/// mating_match
	
	
	// 메이팅 관리 화면에서 버튼 뿌려줄 시 제어할 메소드
	@ResponseBody
	@RequestMapping("/mating/Manage.awa")
	public String insertDelete(@RequestParam Map map,HttpSession session,Model model) throws Exception {
		String temp=map.get("ani_no").toString();
		if(temp.startsWith("insert")) {
			temp=temp.replace("insert", "");
			map.put("ani_no", temp);
			matingService.insert(map);
			return "insert"+map.get("ani_no").toString();
		} else {
			temp=temp.replace("delete", ""); // 들어온 동물번호
			map.put("ani_no", temp);
			String matingNo=getMatingNoToAniNo(map,session);
			
			if(matingNo!=null) {
				map.put("mating_no", matingNo);
				matingService.delete(map);
				return "delete"+map.get("ani_no").toString();
			}
		}/// if
		return "error";
	}/// insertDelete
	
	// 매치 화면에서 모달을 띄우기 위한 메소드
	@ResponseBody
	@RequestMapping(value="/mating/showProfile.awa",produces="text/plain;charset=UTF-8")
	public String showProfile(@RequestParam Map map,Model model) throws Exception {
		System.out.println("matingNo="+map.get("mating_no"));
		MatingDTO dtoMating=matingService.selectOne(map);
		map.put("ani_no",dtoMating.getAni_no());
		AnimalDTO dtoAnimal=animalService.selectOne(map);
		
		JSONObject json=new JSONObject();
		json.put("ani_no",dtoAnimal.getAni_no());
		json.put("mem_no",dtoAnimal.getMem_no());;
		json.put("ani_name",dtoAnimal.getAni_name());
		json.put("ani_age",dtoAnimal.getAni_age());
		json.put("ani_gender",dtoAnimal.getAni_gender());
		json.put("ani_species",dtoAnimal.getAni_species());
		json.put("ani_kind",dtoAnimal.getAni_kind());
		json.put("ani_pic",dtoAnimal.getAni_pic());
		
		// 해당 동물에 대한 주인 정보를 저장 할 속성 추가
		json.put("mem_name",dtoAnimal.getMem_name());
		json.put("mem_nickname",dtoAnimal.getMem_nickname());
		
		return json.toJSONString();
	}/// showProfile
	
	@RequestMapping("/securtiy/mating/draftInsert.aw")
	public String drafting(@RequestParam Map map,HttpServletResponse response) throws Exception {
		System.out.println(map.get("send_no")+", "+map.get("receive_no"));
		
		map.put("mating_no",map.get("send_no"));
		map.put("sending", true);
		map.put("start", 1);
		map.put("end", draftService.getTotalRecord(map));
		List<Map> draftList=draftService.selectList(map);
		for(Map draft:draftList) {
			if(draft.get("RECEIVE_NO").toString().equals(map.get("receive_no").toString())) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('원래 뜨면 안되는 것');</script>");
				out.flush();
				return "forward:/mating/Match.aw?ani_no=matching"+matingService.selectOne(map).getAni_no();
			}
		}
		
		map.put("mating_no", map.get("send_no"));
		MatingDTO one=matingService.selectOne(map);
		// 드래프팅 하는 거 하면됨
		int draftResult=draftService.insert(map);
		System.out.println(draftResult==1?"입력성공":"입력실패");
		// 결과화면으로
		return "forward:/mating/draftList.aw?mating_no="+map.get("send_no")+"&ani_no="+one.getAni_no();
	}
	
	@RequestMapping("/mating/draftList.aw")
	public String draftingList(@RequestParam Map map,Model model,HttpSession session) throws Exception {
		map.put("ani_no", map.get("ani_no"));
		map.put("mem_no", session.getAttribute("mem_no"));
		// 신청한 목록 뿌려오기
		//System.out.println("mating_no:"+map.get("mating_no"));
		String matingNo=null;
		if(map.get("mating_no")==null) {
			matingNo=getMatingNoToAniNo(map, session);
			map.put("mating_no", matingNo);
		}
		//System.out.println("mating_no:"+map.get("mating_no"));
		int totalRecord=draftService.getTotalRecord(map);
		//System.out.println(totalRecord);
		
		// 신청받은 목록
		map.put("receive", "true");
		map.put("start", 1);
		map.put("end", totalRecord);
		List<Map> draftList=draftService.selectList(map);
		List<MatingDTO> receiveList=new Vector<>();
		List<String> dftNoList=new Vector<>();
		for(Map draft:draftList) {
			if(!draft.get("APPLY").toString().equals("0"))
				continue;
			map.put("mating_no", draft.get("SEND_NO"));
			dftNoList.add(draft.get("DFT_NO").toString());
			receiveList.add(matingService.selectOne(map));
		}
		
		// 신청한 목록
		map.remove("receive");
		map.put("sending", "true");
		map.put("start", 1);
		map.put("end", totalRecord);
		draftList=draftService.selectList(map);
		List<MatingDTO> sendList=new Vector<>();
		for(Map draft:draftList) {
			System.out.println(draft);
			System.out.println(draft.get("APPLY"));
			if(!draft.get("APPLY").toString().equals("0"))
				continue;
			map.put("mating_no", draft.get("RECEIVE_NO"));
			MatingDTO dto=matingService.selectOne(map);
			if(!dto.getMem_no().equals(map.get("mem_no"))) {
				sendList.add(dto);
			}
		}
		model.addAttribute("dftNoList",dftNoList);
		model.addAttribute("sendList",sendList);
		model.addAttribute("receiveList",receiveList);
		// 결과화면으로
		return "mating/draftingList.tiles";
	}///draftingList
	
	@ResponseBody
	@RequestMapping(value="/mating/draftApply.awa",produces="text/plain;charset=UTF-8")
	public String draftApply(@RequestParam Map map,Model model) throws Exception {
		Set<String> set=map.keySet();
		for(String key:set)
			System.out.println(key+" : "+map.get(key));
		String param=map.get("dft_no").toString();
		int affected=0;
		if(param.contains("ok")) {
			map.put("dft_no",map.get("dft_no").toString().replace("ok", ""));
			map.put("apply", "1");
			affected=draftService.update(map);
			return "ok"+affected;
		} else {
			map.put("dft_no",map.get("dft_no").toString().replace("no", ""));
			map.put("apply", "2");
			affected=draftService.update(map);
			return "no"+affected;
		}/// if
	}/// draftApply
}// class
