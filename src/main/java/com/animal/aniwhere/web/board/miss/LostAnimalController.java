package com.animal.aniwhere.web.board.miss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.impl.miss.LostAnimalServiceImpl;
import com.animal.aniwhere.service.member.MemberDTO;
import com.animal.aniwhere.service.miss.LostAnimalDTO;

@Controller
public class LostAnimalController {

	@Resource(name="lostAniService")
	private LostAnimalServiceImpl service;
	
	@ResponseBody
 	@RequestMapping(value = "/LostAnimal.awa", method = RequestMethod.POST,produces = "text/plain; charset=UTF-8")
 	public String androidLostAnimal(@RequestParam Map map) throws Exception{
		
		System.out.println("===============");
		int count = service.getTotalRecord(null);
		map.put("start", 1);
		map.put("end", count);
		List<LostAnimalDTO> lists = service.selectList(map);		
		List<Map> collections = new Vector<Map>();
		
		for(LostAnimalDTO list:lists) {
			Map record = new HashMap();
			record.put("no", list.getNo());
			record.put("place", list.getPlace());
			record.put("kind", list.getKind());
			record.put("start_notice", list.getStart_notice()+"");
			record.put("end_notice", list.getEnd_notice()+"");
			record.put("img_src", list.getImg_src());
			record.put("gender", list.getGender());
			record.put("neuter", list.getNeuter());
			record.put("addr", list.getAddr());
			record.put("careNm", list.getCarenm());
			record.put("careTel", list.getCaretel());
			record.put("chargeNm", list.getChargenm());
			collections.add(record);
		}
		return JSONArray.toJSONString(collections);     
    }
}
