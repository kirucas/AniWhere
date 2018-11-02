package com.animal.aniwhere.web.where;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.StoreLocationDTO;
import com.animal.aniwhere.service.impl.StoreLocationServiceImpl;

@Controller
public class WhereController {

	@Resource(name = "StoreLocService")
	private StoreLocationServiceImpl storelocservice;

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
		System.out.println("=========zz=========");
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
}
