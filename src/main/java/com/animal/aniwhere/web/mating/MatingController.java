package com.animal.aniwhere.web.mating;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.impl.MatingServiceImpl;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;

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

	@RequestMapping("/matingLogin.aw")
	public String mating_login(@RequestParam Map map,HttpSession session) throws Exception {
		System.out.println("session mem_no:"+session.getAttribute("mem_no"));
		map.put("mem_no", session.getAttribute("mem_no"));
		System.out.println("mem_no:"+map.get("mem_no"));
		// 동물 등록이 되어있는지 확인하기
		if(animalService.getTotalRecord(map)==0) { // 등록된 동물이 없는 경우
			System.out.println("동물 등록 페이지로 이동");
			
			return "forward:/matingRegiList.aw";
			// 동물 등록 페이지로 이동합니다
			//return "";
		} else {
			List<MatingDTO> matingList=matingService.selectList(map);
			if(matingList==null || matingList.size()==0) { // 등록된 프로필 카드가 없을 경우
				return "forward:/matingRegiList.aw";
			} else {
				// 메이팅 시작 화면으로 넘어갑니다
				// 메이팅 등록관련 데이터 입력
				for(MatingDTO dto:matingList) {
					dto.getAni_name();
				}/// for 
				map.put("list",matingList);
				return "mating/matingLogin.tiles";
			}/// if
		}/// if
	}/// mating_login
	
	@RequestMapping("/matingRegiList.aw")
	public String mating_regist() throws Exception {
		
		return "mating/matingRegiList.tiles";
	}

	@RequestMapping("/matingMatch.aw")
	public String mating_match() throws Exception {
		
		return "mating/matingMatch.tiles";
	}	
}// class
