package com.animal.aniwhere.web.mating;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.impl.MatingServiceImpl;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;
import com.animal.aniwhere.service.member.AnimalDTO;

@Controller
public class MatingController {
	@Resource(name="matingService")
	private MatingServiceImpl matingService;
	@Resource(name="animalService")
	private AnimalServiceImpl animalService;

	@RequestMapping("/mating/main.aw")
	public String mating_main() throws Exception {
		return "mating/matingMain.tiles";
	}////////// mating_main

	@RequestMapping("/mating/matingProfile.aw")
	public String mating_profile() throws Exception {
		
		return "mating/matingProfile.tiles";
	}

	@RequestMapping("/security/matingLogin.aw")
	public String mating_login(@RequestParam Map map,HttpSession session,HttpServletResponse response) throws Exception {
		//System.out.println("session mem_no:"+session.getAttribute("mem_no"));
		map.put("mem_no", session.getAttribute("mem_no"));
		//System.out.println("mem_no:"+map.get("mem_no"));
		// 동물 등록이 되어있는지 확인하기
		if(animalService.getTotalRecord(map)==0) { // 등록된 동물이 없는 경우
			System.out.println("동물 등록 페이지로 이동");
			// 동물 등록 페이지로 이동합니다
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 애완동물이 없어 등록 페이지로 갑니다.');</script>");
			out.flush();
			return "forward:/member_info.aw";
		} else {
			// 등록된 동물은 있으니까 
			return "forward:/matingRegiList.aw";
		}/// if
	}/// mating_login
	
	@RequestMapping("/matingRegiList.aw")
	public String mating_regist(HttpSession session,Map map) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no"));
		List<AnimalDTO> list=animalService.selectList(map);
		List<AnimalDTO> matingList=matingService.selectMyMating(map);
		map.put("anirecord",list);
		map.put("matingrecord",matingList);
		return "mating/matingRegiList.tiles";
	}

	@RequestMapping("/matingMatch.aw")
	public String mating_match(@RequestParam Map map,Model model) throws Exception {
		System.out.println(map.get("ani_no"));
		
		map.put("ani_no", map.get("ani_no").toString().replace("matcing", ""));
		AnimalDTO animal=animalService.selectOne(map);
		map.put("ani_gender", animal.getAni_gender()=="M"?"F":animal.getAni_gender()=="F"?"M":"U");
		map.put("ani_species",animal.getAni_species());
		if(animal.getAni_kind()!=null)
			map.put("ani_kind", animal.getAni_kind());
		
		model.addAttribute("start", 1);
		model.addAttribute("end", 10);
		
		List<MatingDTO> matingList=matingService.selectList(map);		
		
		model.addAttribute("list",matingList);
		
		return "mating/matingMatch.tiles";
	}/// mating_match
	
	@ResponseBody
	@RequestMapping("/matingManage.awa")
	public String insertDelete(@RequestParam Map map,HttpSession session,Model model) throws Exception {
		String temp=map.get("ani_no").toString();
		System.out.println(temp);
		System.out.println(map.get("mating_loc"));
		if(temp.startsWith("insert")) {
			temp=temp.replace("insert", "");
			map.put("ani_no", temp);
			matingService.insert(map);
			return "insert";
		} else {
			temp=temp.replace("delete", "");
			map.put("ani_no", temp);
			map.put("mem_no", session.getAttribute("mem_no"));
			AnimalDTO animal=animalService.selectOne(map); // 현재 누른 동물 정보 얻어오기
			map.put("ani_species",animal.getAni_species());
			map.put("ani_gender",animal.getAni_gender());
			map.put("ani_kind",animal.getAni_kind());
			map.put("start", 1);
			map.put("end", matingService.getTotalRecord(map));
			List<MatingDTO> list=matingService.selectList(map); // 그 동물이 속한 그룹을 메이팅에서 얻어옴
			String matingNo=null;
			for(MatingDTO dto:list) {
				if(dto.getAni_no()==animal.getAni_no())
					matingNo=dto.getMating_no(); // 그걸 토대로 같은 동물번호인 메이팅을 얻어옴
			}
			if(matingNo!=null) {
				map.put("mating_no", matingNo);
				matingService.delete(map);
				return "delete";
			}
			return "error";
			
		}/// if
	}/// insertDelete
}// class
