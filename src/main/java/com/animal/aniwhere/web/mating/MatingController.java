package com.animal.aniwhere.web.mating;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.impl.DraftingServiceImpl;
import com.animal.aniwhere.service.impl.MatingServiceImpl;
import com.animal.aniwhere.service.impl.member.AndroidTokenServiceImpl;
import com.animal.aniwhere.service.impl.member.AnimalServiceImpl;
import com.animal.aniwhere.service.member.AnimalDTO;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Sender;

@Controller
public class MatingController {
	@Resource(name="matingService")
	private MatingServiceImpl matingService;
	@Resource(name="animalService")
	private AnimalServiceImpl animalService;
	@Resource(name="draftingService")
	private DraftingServiceImpl draftService;
	@Resource(name="tokenService")
	private AndroidTokenServiceImpl androidservice;

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
		List<AnimalDTO> list=animalService.selectList(map); // 유저의 전체 애완동물 리스트
		List<AnimalDTO> matingList=matingService.selectMyMating(map); // 유저의 전체 메이팅 등록 리스트
		List<AnimalDTO> matingListToModel=new Vector<>(); /// 위의 리스트에서 일부를 담아 Model에 담기위한 리스트
		for(AnimalDTO dto:matingList) {
			map.put("ani_no",dto.getAni_no());
			String mating_no=getMatingNoToAniNo(map, session); // 각 메이팅된 동물의 메이팅 번호를 알아낸다
			//System.out.println("mating_no:"+mating_no);
			map.put("mating_no", mating_no);
			List<Map> draftMapList=draftService.selectList(map); // 위에서 알아낸 메이팅 번호로 드래프트 리스트를 구해낸다
			/*if(matingListToModel.contains(dto))
				continue;
			else */if(draftMapList.size()==0) {
				matingListToModel.add(dto);
				//System.out.println("드래프트가 없음");
				continue;
			} //else System.out.println("드래프트가 있다"+draftMapList.size());
			for(Map draft:draftMapList) {
				if(!draft.get("APPLY").toString().equals("1")) { // 만남 신청중인게 단 하나라도 있으면
					matingListToModel.add(dto); // 리스트에 담아서 날린다. 출력해야 하기 때문
					//System.out.println(draft.get("APPLY"));
					break;
				}/// if
			}/// for
		}/// for
		map.put("anirecord",list);
		map.put("matingrecord",matingListToModel); // 본의아니게 Map에 담아날림
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
		int max=0;
		for(MatingDTO dto:list) {
			if(dto.getAni_no().equals(animal.getAni_no())) {
				// 그걸 토대로 같은 동물번호인 메이팅을 얻어옴
				int current=Integer.parseInt(dto.getMating_no()); 
				max=current>max?current:max;
				matingNo=String.valueOf(max);
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
		//System.out.println("map.get(\"ani_kind\"):"+map.get("ani_kind"));
		if(!(animal.getAni_species().equals("3") || animal.getAni_species().equals("5")))
			map.remove("ani_kind");
		// 임시
		map.put("start",1);
		map.put("end",matingService.getTotalRecord(map));
		List<MatingDTO> matingList=matingService.selectList(map); // 반대성별의 메이팅 동물 얻어옴
		List<MatingDTO> matingListToModel=new Vector<>();
		for(MatingDTO dto:matingList) {
			// 본인의 동물 거르기
			if(dto.getMem_no().equals(session.getAttribute("mem_no")))
				continue;
			map.put("mating_no",dto.getMating_no());
			map.put("start", 1);
			map.put("end", draftService.getTotalRecord(map));
			List<Map> draftList=draftService.selectList(map);
			if(draftList.size()==0) {
				matingListToModel.add(dto);
			}
			for(Map draft:draftList) {
				if(draft.get("APPLY").toString().equals("0"))
					matingListToModel.add(dto);
			}
		}/// for
		
		model.addAttribute("matingNo",matingNo);
		model.addAttribute("animal",animal);
		model.addAttribute("list",matingListToModel);
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
			int affect = matingService.insert(map);
			if(affect ==1 ) {
				map.put("ani_checking", "1");
				animalService.update(map);
			}
			return "insert"+map.get("ani_no").toString();
		} else {
			temp=temp.replace("delete", ""); // 들어온 동물번호
			map.put("ani_no", temp);
			String matingNo=getMatingNoToAniNo(map,session);
			
			if(matingNo!=null) {
				map.put("mating_no", matingNo);
				int affect = matingService.delete(map);
				if(affect == 1) {
					map.put("ani_checking", "0");
					animalService.update(map);
				}
				return "delete"+map.get("ani_no").toString();
			}
		}/// if
		return "error";
	}/// insertDelete
	
	// 매치 화면에서 모달을 띄우기 위한 메소드
	@ResponseBody
	@RequestMapping(value="/mating/showProfile.awa",produces="text/plain;charset=UTF-8")
	public String showProfile(@RequestParam Map map,Model model) throws Exception {
		//System.out.println("matingNo="+map.get("mating_no"));
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
	
	// 메이팅 등록된 애완동물이 만남을 신청했을때
	@RequestMapping("/securtiy/mating/draftInsert.aw")
	public String drafting(@RequestParam Map map,HttpServletResponse response) throws Exception {
		//System.out.println(map.get("send_no")+", "+map.get("receive_no"));
		
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
		//System.out.println(draftResult==1?"입력성공":"입력실패");
		// 결과화면으로
		return "forward:/mating/draftList.aw?mating_no="+map.get("send_no")+"&ani_no="+one.getAni_no();
	}
	
	// 만남을 신청하거나 신청받은 내용 리스트
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
			//System.out.println(draft);
			//System.out.println(draft.get("APPLY"));
			if(!draft.get("APPLY").toString().equals("0"))
				continue;
			map.put("mating_no", draft.get("RECEIVE_NO"));
			MatingDTO dto=matingService.selectOne(map);
			if(!dto.getMem_no().equals(map.get("mem_no"))) {
				sendList.add(dto);
			}
		}
		model.addAttribute("animal",animalService.selectOne(map));
		model.addAttribute("dftNoList",dftNoList);
		model.addAttribute("sendList",sendList);
		model.addAttribute("receiveList",receiveList);
		// 결과화면으로
		return "mating/draftingList.tiles";

	}///draftingList
	
	// 신청받은 만남을 수락하거나 거절
	@ResponseBody
	@RequestMapping(value="/mating/draftApply.awa",produces="text/plain;charset=UTF-8")
	public String draftApply(@RequestParam Map map,Model model,HttpSession session) throws Exception {
		String param=map.get("dft_no").toString();
		System.out.println(param);
		int affected=0;
		if(param.contains("ok")) {
			map.put("dft_no",param.replace("ok", ""));
			map.put("apply", "1"); // 수락
			affected=draftService.update(map);
			//안드로이드 버튼 초기화
			map.put("ani_checking", "0");
			map.put("ani_no", map.get("ani_no").toString().replaceAll("buttonPlace", ""));
			animalService.update(map);
			
			Map applyMap=draftService.selectOne(map);
			// 승낙 FCM 보내기
			map.put("mating_no",applyMap.get("SEND_NO").toString());
			MatingDTO sender=matingService.selectOne(map);
			
			//System.out.println("승낙 FCM 발사:"+map.get("dft_no"));
			fireBasePushAsyncTask(sender.getMem_no(),keywordGenerator(applyMap,"수락"),map.get("tel").toString(),map.get("ani_no").toString());
			// 수락을 하는 순간 같은 리시버이면서 0인 목록들을 전부 2로 수정
			map.put("mating_no",applyMap.get("RECEIVE_NO"));
			map.put("start", 1);
			map.put("end", draftService.getTotalRecord(map));
			List<Map> abortList=draftService.selectList(map);
			for(Map abort:abortList) {
				if(abort.get("APPLY").toString().equals("0")) {
					map.put("dft_no", abort.get("DFT_NO"));
					map.put("apply", "2");
					draftService.update(map);
					
					map.put("mating_no",abort.get("SEND_NO").toString());
					sender=matingService.selectOne(map);
					// 거절 FCM 보내기
					if(sender.getMem_no()!=session.getAttribute("mem_no")) {
						//System.out.println("거절 FCM 발사:"+abort.get("DFT_NO"));
						fireBasePushAsyncTask(sender.getMem_no(),keywordGenerator(abort,"거절"),null,null);
					}
				}
			}/// for
			
			return "ok"+affected;
		} else {
			map.put("dft_no",map.get("dft_no").toString().replace("no", ""));
			map.put("apply", "2"); // 거절
			affected=draftService.update(map);
			//안드로이드 버튼 초기화
			map.put("ani_checking", "0");
			map.put("ani_no", map.get("ani_no").toString().replaceAll("buttonPlace", ""));
			animalService.update(map);
			// 거절 FCM 보내기
			Map applyMap=draftService.selectOne(map);
			map.put("mating_no",applyMap.get("SEND_NO").toString());
			MatingDTO sender=matingService.selectOne(map);
			fireBasePushAsyncTask(sender.getMem_no(),keywordGenerator(applyMap,"거절"), null,null);
			return "no"+affected;
		}/// if
	}/// draftApply
	
	public String keywordGenerator(Map draftMap,String keyword) {
		Map map=new HashMap();
		map.put("mating_no",draftMap.get("SEND_NO"));
		MatingDTO sender=matingService.selectOne(map);
		map.put("mating_no",draftMap.get("RECEIVE_NO"));
		MatingDTO receiver=matingService.selectOne(map);
		/*System.out.println(String.format("%s님이 귀하의 %s와(과) %s(%s)의 만남 신청을 %s했습니다.", 
				receiver.getMem_nickname(),sender.getAni_name(),
				receiver.getAni_name(),receiver.getAni_kind(),keyword));*/
		return String.format("%s님이 귀하의 %s와 %s(%s)의 만남 신청을 %s했습니다.", 
				receiver.getMem_nickname(),sender.getAni_name(),
				receiver.getAni_name(),receiver.getAni_kind(),keyword);
	}///keywordGenerator
	
	public String fireBasePushAsyncTask(String target_no,String message,String tel, String ani_no) throws Exception {
		Map map=new HashMap();
		map.put("mem_no", target_no);
		Map result = androidservice.selectOne(map);
		if (result!=null && !result.get("MTK_TOKEN").equals("null")) {
			//System.out.println("FireBasePushAsyncTask");

			String API_KEY = "AAAAHkvJ_3Y:APA91bG8v0lVhWawMh5bzuUjornLGLrJhlI6SQ1CkjOC82chQHKT2sC79WmlA-eZka6Gwe6sru3GegbZmwK1zv_M_ig9Qv3dgzLf4HrL_XJj42jhY5hhnI-eFB0dE_nkqdZCPmWmDJ5o";
			String gcmURL = "https://fcm.googleapis.com/fcm/send";
			
			Sender sender = new Sender(API_KEY);
	        Message msg = new Message.Builder() 
	        		.addData("message",message+"@"+tel+"@"+ani_no)//데이타 메시지
	                .addData("title","만나요 알림서비스")//데이타 타이틀       
	                .build();
	        ArrayList<String> token = new ArrayList<String>(); 
	        token.add(result.get("MTK_TOKEN").toString());
	        try {
		        MulticastResult multicast = sender.send(msg,token,3);
		        if(multicast != null)
		        	return "true";
	        }catch(Exception e) {
	        	//System.out.println(e.getMessage());
	        	return "err";
	        }
		}/// if
		return "false";
	}/// FireBasePushAsyncTask
	
	//안드로이드 매칭 클릭했을때
		@ResponseBody
		@RequestMapping(value = "/androidMatching.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
		public String androidMatching(@RequestParam Map map,HttpSession session) throws Exception {
			if(map.get("matching").toString().equals("매칭")) {
				int affect = matingService.insert(map);
				if(affect == 1) {
					map.put("ani_checking", "1");
					animalService.update(map);
					return "매칭";
				}else {
					return "매칭실패";
				}
			}else {//매칭 취소
				session.setAttribute("mem_no", map.get("mem_no"));
				String mattingNO = getMatingNoToAniNo(map,session);
				map.put("mating_no", mattingNO);
				int dAffect = matingService.delete(map);
				if(dAffect == 1) {
					map.put("ani_checking", "0");
					animalService.update(map);
					return "매칭취소";
				}else {
					return "매칭취소실패";
				}
			}
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/androidMatchingFind.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
		public String androidMatchingFind(@RequestParam Map map,HttpSession session) throws Exception {
			String ani_species = map.get("ani_species").toString();
			
			if(ani_species.equals("1") || ani_species.equals("2") || ani_species.equals("4")) 
				map.remove("ani_kind");			
			
			map.put("start",1);
			map.put("end",matingService.getTotalRecord(map));
			List<MatingDTO> matingList=matingService.selectList(map); // 반대성별의 메이팅 동물 얻어옴
			
			List<MatingDTO> matingListToModel=new Vector<>();
			for(MatingDTO dto:matingList) {
				// 본인의 동물 거르기
				if(dto.getMem_no().equals(map.get("mem_no")))
					continue;
				map.put("mating_no",dto.getMating_no());
				map.put("start", 1);
				map.put("end", draftService.getTotalRecord(map));
				List<Map> draftList=draftService.selectList(map);
				if(draftList.size()==0) {
					matingListToModel.add(dto);
					continue;
				}
				for(Map draft:draftList) {
					if(draft.get("APPLY").toString().equals("0"))
						matingListToModel.add(dto);
				}
			}/// for
									
			List<Map> collections = new Vector<Map>();
			for (MatingDTO list : matingListToModel) {								
				Map record = new HashMap();
				record.put("mating_no", list.getMating_no());
				record.put("ani_no", list.getAni_no());
				record.put("mating_loc", list.getMating_loc());
				record.put("mating_regidate", list.getMating_regidate()+"");
				record.put("ani_name", list.getAni_name());
				record.put("ani_age", list.getAni_age());
				record.put("ani_species", list.getAni_species());
				record.put("ani_kind", list.getAni_kind());
				record.put("ani_pic", list.getAni_pic());
				record.put("mem_no", list.getMem_no());
				record.put("mem_nickname", list.getMem_nickname());
				collections.add(record);
			}		
			
			System.out.println("androidMatchingFind=============");
			System.out.println(JSONArray.toJSONString(collections));
			return JSONArray.toJSONString(collections);
		}
		
		@ResponseBody
		@RequestMapping(value = "/androidDraftInsert.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
		public String androidDraftInsert(@RequestParam Map map,HttpSession session) throws Exception {
			session.setAttribute("mem_no", map.get("mem_no"));
			String mattingNO = getMatingNoToAniNo(map,session);
			map.put("send_no", mattingNO);
			int affect = draftService.insert(map);
			
			if(affect == 1) {
				return "true";
			}
			
			return "false";
		}
		
		@ResponseBody
		@RequestMapping(value = "/androidGetTargetAnimal.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
		public String androidGetTargetAnimal(@RequestParam Map map,HttpSession session) throws Exception {
			AnimalDTO dto = animalService.selectOne(map);
			JSONObject json = new JSONObject();
			json.put("ani_pic", dto.getAni_pic());
			json.put("ani_name", dto.getAni_name());
			json.put("ani_gender", dto.getAni_gender());
			json.put("ani_species", dto.getAni_species());			
			return json.toJSONString();
		}

}// class
