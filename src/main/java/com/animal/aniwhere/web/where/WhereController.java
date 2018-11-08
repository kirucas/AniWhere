package com.animal.aniwhere.web.where;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AwsS3Utils;
import com.animal.aniwhere.service.QRCode_Generator;
import com.animal.aniwhere.service.ReservationDTO;
import com.animal.aniwhere.service.StoreLocationDTO;
import com.animal.aniwhere.service.impl.PagingUtil;
import com.animal.aniwhere.service.impl.ReservationServiceImpl;
import com.animal.aniwhere.service.impl.StoreLocationServiceImpl;
import com.animal.aniwhere.service.impl.member.AndroidTokenServiceImpl;
import com.animal.aniwhere.service.impl.member.MemberServiceImpl;

@Controller
public class WhereController {

	@Resource(name = "storeLocService")
	private StoreLocationServiceImpl storelocservice;

	@Resource(name = "reservationService")
	private ReservationServiceImpl reservationservice;
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;

	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;

	@RequestMapping("/where/main.aw")
	public String where_main() throws Exception {
		return "where/whereMain.tiles";
	}////////// mating_main

	// 전체 갖고오기 ajax
	@RequestMapping(value = "/security/where/map/total.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String whole(Model model, @RequestParam Map map, HttpServletResponse response) throws Exception {
		List<StoreLocationDTO> lists = storelocservice.selectList(map);
		List<Map> collections = new Vector<Map>();

		for (StoreLocationDTO list : lists) {
			Map record = new HashMap();
			record.put("bizesId", list.getBizesid());
			record.put("bizesNm", list.getBizesnm());
			record.put("brchNm", list.getBrchnm());
			record.put("indsSclsCd", list.getIndssclscd());
			record.put("indsSclsNm", list.getIndssclsnm());
			record.put("lnoAdr", list.getLnoadr());
			record.put("rdnmAdr", list.getRdnmadr());
			record.put("lon", list.getLon());
			record.put("lat", list.getLat());
			record.put("dongNo", list.getDongno());
			record.put("flrNo", list.getFlrno());
			record.put("hoNo", list.getHono());
			collections.add(record);
		} //// for
		return JSONArray.toJSONString(collections);
	}///////////// whole

	// 옆에 하나 선택
	@RequestMapping(value = "/security/where/map/select.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam Map map, HttpServletResponse response) throws Exception {
		String[] codes = ((String) map.get("indssclscd")).split(" ");
		List<Map> collections = new Vector<Map>();
		for (String code : codes) {
			map.put("indssclscd", code);
			List<StoreLocationDTO> lists = storelocservice.selectList(map);
			for (StoreLocationDTO list : lists) {
				Map record = new HashMap();
				record.put("bizesId", list.getBizesid());
				record.put("bizesNm", list.getBizesnm());
				record.put("brchNm", list.getBrchnm());
				record.put("indsSclsCd", list.getIndssclscd());
				record.put("indsSclsNm", list.getIndssclsnm());
				record.put("lnoAdr", list.getLnoadr());
				record.put("rdnmAdr", list.getRdnmadr());
				record.put("lon", list.getLon());
				record.put("lat", list.getLat());
				record.put("dongNo", list.getDongno());
				record.put("flrNo", list.getFlrno());
				record.put("hoNo", list.getHono());
				collections.add(record);
			} //// inner for
		} /// outter for
		return JSONArray.toJSONString(collections);
	}///////////// select

	// 옆에 하나 선택
	@RequestMapping(value = "/security/where/map/near.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String near(Model model, @RequestParam Map map, HttpServletResponse response,
			@RequestParam(value = "mylat") String mylats, @RequestParam(value = "mylon") String mylons)
			throws Exception {
		List<StoreLocationDTO> lists = storelocservice.selectList(map);
		List<Map> collections = new Vector<Map>();

		for (StoreLocationDTO list : lists) {
			Map record = new HashMap();
			record.put("bizesId", list.getBizesid());
			record.put("bizesNm", list.getBizesnm());
			record.put("brchNm", list.getBrchnm());
			record.put("indsSclsCd", list.getIndssclscd());
			record.put("indsSclsNm", list.getIndssclsnm());
			record.put("lnoAdr", list.getLnoadr());
			record.put("rdnmAdr", list.getRdnmadr());
			record.put("lon", list.getLon());
			record.put("lat", list.getLat());
			record.put("dongNo", list.getDongno());
			record.put("flrNo", list.getFlrno());
			record.put("hoNo", list.getHono());

			// 반경 계산

			double diskill = 0;
			double mylat = Double.parseDouble(mylats);
			double mylon = Double.parseDouble(mylons);
			diskill = LocationDistance(mylat, mylon, Double.parseDouble(record.get("lat").toString()),
					Double.parseDouble(record.get("lon").toString()));

			record.put("diskill", String.format("%.1f", diskill));

			if (diskill <= 2.0) {
				collections.add(record);
			}
		} //// for
		return JSONArray.toJSONString(collections);
	}///////////// near

	// 옆에 하나 선택
	@RequestMapping(value = "/security/where/map/nearselect.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String nearselect(Model model, @RequestParam Map map, HttpServletResponse response,
			@RequestParam(value = "mylat") String mylats, @RequestParam(value = "mylon") String mylons)
			throws Exception {
		String[] codes = ((String) map.get("indssclscd")).split(" ");
		List<Map> collections = new Vector<Map>();
		for (String code : codes) {
			map.put("indssclscd", code);
			List<StoreLocationDTO> lists = storelocservice.selectList(map);
			for (StoreLocationDTO list : lists) {
				Map record = new HashMap();
				record.put("bizesId", list.getBizesid());
				record.put("bizesNm", list.getBizesnm());
				record.put("brchNm", list.getBrchnm());
				record.put("indsSclsCd", list.getIndssclscd());
				record.put("indsSclsNm", list.getIndssclsnm());
				record.put("lnoAdr", list.getLnoadr());
				record.put("rdnmAdr", list.getRdnmadr());
				record.put("lon", list.getLon());
				record.put("lat", list.getLat());
				record.put("dongNo", list.getDongno());
				record.put("flrNo", list.getFlrno());
				record.put("hoNo", list.getHono());

				// 반경 계산

				double diskill = 0;
				double mylat = Double.parseDouble(mylats);
				double mylon = Double.parseDouble(mylons);
				diskill = LocationDistance(mylat, mylon, Double.parseDouble(record.get("lat").toString()),
						Double.parseDouble(record.get("lon").toString()));

				record.put("diskill", String.format("%.1f", diskill));

				if (diskill <= 10.0) {
					collections.add(record);
				}
			} //// inner for
		} //// outter for
		return JSONArray.toJSONString(collections);
	}///////////// near

	public double LocationDistance(double mylat, double mylon, double otherlat, double otherlon) {
		// 마일(Mile) 단위
		// double distanceMile =
		// distance(37.504198, 127.047967, 37.501025, 127.037701, "");

		// 미터(Meter) 단위
		// double distanceMeter =
		// distance(37.504198, 127.047967, 37.501025, 127.037701, "meter");

		// 킬로미터(Kilo Meter) 단위
		double distanceKiloMeter = distance(mylat, mylon, otherlat, otherlon, "kilometer");

		// System.out.println(distanceMile);
		// System.out.println(distanceMeter);
		/**
		 * 두 지점간의 거리 계산
		 *
		 * @param lat1
		 *            지점 1 위도
		 * @param lon1
		 *            지점 1 경도
		 * @param lat2
		 *            지점 2 위도
		 * @param lon2
		 *            지점 2 경도
		 * @param unit
		 *            거리 표출단위
		 * @return
		 */
		return distanceKiloMeter;
	}

	double distance(double lat1, double lon1, double lat2, double lon2, String unit) {

		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		if (unit == "kilometer") {
			dist = dist * 1.609344;
		} else if (unit == "meter") {
			dist = dist * 1609.344;
		}

		return (dist);
	}

	// This function converts decimal degrees to radians
	private double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	// This function converts radians to decimal degrees
	private double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

	// 예약 페이지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ
	@RequestMapping("/security/where/reservation.awa")
	public String reservation_write_form(Model model, @RequestParam Map map) throws Exception {
		model.addAttribute("store_no", map.get("store_no"));
		model.addAttribute("bizesNm", map.get("bizesNm"));
		model.addAttribute("booking_date", map.get("booking_date"));
		// 뷰정보 반환]
		return "where/reservationMain.tiles";
	}// reservation_write_form

	@Resource(name="tokenService")
	private AndroidTokenServiceImpl tokenService;
	
	@RequestMapping("/where/reservate.awa")
	public String reservate(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest req) throws Exception {
		map.put("mem_no", session.getAttribute("mem_no").toString());
		
		String qr_link = AwsS3Utils.namingForS3("QRCodes");
		
		map.put("qr_link", qr_link);
		
		int insert = reservationservice.insert(map);
		if (insert == 0) {
			model.addAttribute("check", 0);
			return "where/Message";
		}
		
		boolean result_QRCreate = QRCode_Generator.createQRCodeData(map, req, storelocservice, memberService, reservationservice);
		
		if(!result_QRCreate) {
			reservationservice.delete(map);
			model.addAttribute("check", 0);
			return "where/Message";
		}
		
		model.addAttribute("check", 1);
		
		// 뷰정보 반환]
		return "where/Message";
	} // reservate

	@RequestMapping("/security/where/reservation_check.aw")
	public String reservate_check(Model model, HttpServletRequest req,// 페이징용 메소드에 전달
			HttpSession session,
			@RequestParam Map map, // 검색용 파라미터 받기
			@RequestParam(required = false, defaultValue = "1") int nowPage// 페이징용 nowPage파라미터 받기용
	) throws Exception {
		// 서비스 호출]
		// 페이징을 위한 로직 시작]
		// 전체 레코드 수
		System.out.println(session.getAttribute("mem_no").toString());
		map.put("mem_no", session.getAttribute("mem_no").toString());
		int totalRecordCount = reservationservice.getTotalRecord(map);
		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		// 페이징을 위한 로직 끝]
		List<ReservationDTO> list = reservationservice.selectList(map);
		// 페이징 문자열을 위한 로직 호출]
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/where/reservation_check.aw?");
		// 데이터 저장]
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("list", list);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		// 뷰정보 반환]
		return "where/reservation_list.tiles";
		
		
		
	}// reservate_check
	@RequestMapping("/security/where/reservation_view.aw")
	public String reservate_view(Model model, HttpServletRequest req, // 페이징용 메소드에 전달
			@RequestParam Map map, // 검색용 파라미터 받기
			@RequestParam(required = false, defaultValue = "1") int nowPage// 페이징용 nowPage파라미터 받기용
	) throws Exception {
		map.put("rv_no", map.get("rv_no"));
		ReservationDTO dto = reservationservice.selectOne(map);
		map.put("bizesid", dto.getStore_no());
		StoreLocationDTO store = storelocservice.selectOne(map);
		dto.setQr_link(AwsS3Utils.LINK_ADDRESS + dto.getQr_link());
		model.addAttribute("dto",dto);
		model.addAttribute("store",store);
		return "where/reservation_view.tiles";
	}
	
	@RequestMapping("/security/where/reservation/delete.aw")
	public String reservate_cancel(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception {
		map.put("rv_no", map.get("rv_no"));
		int delete = reservationservice.delete(map);
		if (delete == 1)
			model.addAttribute("del", 1);
		else
			model.addAttribute("del", 0);
		return "where/Message";
	}
	
	// @RequestMapping(value= "/where/map/radius.awa", method=
	// RequestMethod.POST,produces="text/plain; charset=UTF-8")
	// @ResponseBody
	// public String mapdata(@RequestParam Map map,HttpServletResponse response)
	// throws Exception{
	// JSONObject jsonObj = new JSONObject();
	// String[] codes = ((String)map.get("code")).split("/");
	// for(String code : codes) {
	// String API_URL =
	// "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=2000&type=json&cx="+map.get("lon")+"&cy="+map.get("lat")+"&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
	// HttpURLConnection conn = (HttpURLConnection) new
	// URL(API_URL).openConnection();
	// conn.setRequestMethod("GET");
	// int responseCode = conn.getResponseCode();
	// if(responseCode != 200) {
	// System.err.println("연결 실패: " + responseCode);
	// System.err.println("실패 코드 값 : "+ code);
	// continue;
	// }
	// String line;
	// StringBuilder json = new StringBuilder();
	// BufferedReader br = new BufferedReader(new
	// InputStreamReader(conn.getInputStream()));
	// while((line= br.readLine())!=null) {
	// json.append(line+System.getProperty("line.separator"));
	// }
	// br.close();
	// conn.disconnect();
	// //String result = URLEncoder.encode(json.toString() , "UTF-8");
	// String result = json.toString();
	// jsonObj.put(code, result);
	// }
	// return jsonObj.toJSONString();
	// }//////////////mapdata

	// 임의의 메소드 (사용하지ㅏㄶ음)
	// @RequestMapping(value= "/where/map/D09A01.aw", method= RequestMethod.POST)
	// @ResponseBody
	// public String d09a01(@RequestParam Map map,HttpServletResponse response)
	// throws Exception{
	// JSONObject jsonObj = new JSONObject();
	//
	// String API_URL =
	// "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInUpjong?divId=indsSclsCd&pageNo=2&key=D09A01&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
	// HttpURLConnection conn = (HttpURLConnection) new
	// URL(API_URL).openConnection();
	// conn.setRequestMethod("GET");
	// int responseCode = conn.getResponseCode();
	// if(responseCode != 200) {
	// System.err.println("연결 실패: " + responseCode);
	// System.exit(1);
	// }
	// String line;
	// StringBuilder json = new StringBuilder();
	// BufferedReader br = new BufferedReader(new
	// InputStreamReader(conn.getInputStream()));
	// while((line= br.readLine())!=null) {
	// json.append(line+System.getProperty("line.separator"));
	// }
	// br.close();
	// conn.disconnect();
	// System.out.println(json);
	// String result = URLEncoder.encode(json.toString() , "UTF-8");
	// return result;
	// }//////////////

	// 안드로이드
	@ResponseBody
	@RequestMapping(value = "/androidMap.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String android(@RequestParam Map map) throws Exception {

		List<StoreLocationDTO> lists = storelocservice.selectList(map);
		System.err.println(lists.size() + "=============");
		List<Map> collections = new Vector<Map>();

		for (StoreLocationDTO list : lists) {
			Map record = new HashMap();
			record.put("bizesId", list.getBizesid());
			record.put("bizesNm", list.getBizesnm());
			record.put("brchNm", list.getBrchnm());
			record.put("indsSclsCd", list.getIndssclscd());
			record.put("indsSclsNm", list.getIndssclsnm());
			record.put("lnoAdr", list.getLnoadr());
			record.put("rdnmAdr", list.getRdnmadr());
			record.put("lon", list.getLon());
			record.put("lat", list.getLat());
			record.put("dongNo", list.getDongno());
			record.put("flrNo", list.getFlrno());
			record.put("hoNo", list.getHono());
			collections.add(record);
		}
		return JSONArray.toJSONString(collections);
	}
	@ResponseBody
	@RequestMapping(value = "/androidMyReservation.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidMyAnimal(@RequestParam Map map) throws Exception {
	
		int totalRecordCount = reservationservice.getTotalRecord(map);
		int start = 1;
		int end = totalRecordCount;
		map.put("start", start);
		map.put("end", end);
		List<ReservationDTO> lists = reservationservice.selectList(map);
		List<Map> collections = new Vector<Map>();
		for (ReservationDTO list : lists) {
			Map record = new HashMap();
			record.put("rv_no", list.getRv_no());
			record.put("mem_no", list.getMem_no());
			record.put("store_no", list.getStore_no());
			record.put("apply_date", list.getApply_date());
			record.put("booking_date", list.getBooking_date());
			record.put("qr_link", AwsS3Utils.LINK_ADDRESS + list.getQr_link());
			record.put("mem_name", list.getMem_name());
			record.put("bizesnm", list.getBizesnm());
			record.put("brchnm", list.getBrchnm());
			record.put("rdnmadr", list.getRdnmadr());
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);	
	}
	
	@ResponseBody
	@RequestMapping(value = "/androidReservate.awa", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String androidReservate(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest req) throws Exception {
		
		String qr_link = AwsS3Utils.namingForS3("QRCodes");		
		map.put("qr_link", qr_link);
		
		int insert = reservationservice.insert(map);
		if (insert == 0) {
			return "0";
		}
		
		boolean result_QRCreate = QRCode_Generator.createQRCodeData(map, req, storelocservice, memberService, reservationservice);
		
		if(!result_QRCreate) {
			reservationservice.delete(map);
			return "QR";
		}
		
		return "true";
	}

}
