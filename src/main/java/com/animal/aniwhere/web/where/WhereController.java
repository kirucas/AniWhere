package com.animal.aniwhere.web.where;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.ReservationDTO;
import com.animal.aniwhere.service.StoreLocationDTO;
import com.animal.aniwhere.service.impl.ReservationServiceImpl;
import com.animal.aniwhere.service.impl.StoreLocationServiceImpl;

@Controller
public class WhereController {
	 
	@Resource(name="StoreLocService")
	private StoreLocationServiceImpl storelocservice;
	
	@Resource(name="reservationService")
	private ReservationServiceImpl reservationservice;
	
	  @RequestMapping("/where/main.aw")
	  public String where_main() throws Exception {
	      return "where/whereMain.tiles";
	  }////////// mating_main
	  
	  //전체 갖고오기 ajax
	  @RequestMapping(value= "/security/where/map/total.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
	  @ResponseBody
	  public String whole(Model model,@RequestParam Map map,HttpServletResponse response) throws Exception{
		  List<StoreLocationDTO> lists = storelocservice.selectList(map);
	      List<Map> collections = new Vector<Map>();
    
		  for(StoreLocationDTO list:lists) {
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
		      }////for
		  return JSONArray.toJSONString(collections);
	  }/////////////whole
	  
	  //옆에 하나 선택
	  @RequestMapping(value= "/security/where/map/select.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
	  @ResponseBody
	  public String select(Model model,@RequestParam Map map,HttpServletResponse response) throws Exception{
		  String[] codes = ((String)map.get("indssclscd")).split(" ");
		  List<Map> collections = new Vector<Map>();
		  for(String code : codes) {
			  map.put("indssclscd", code);
			  List<StoreLocationDTO> lists =  storelocservice.selectList(map);
			  for(StoreLocationDTO list:lists) {
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
		      }////inner for
		  }/// outter for
		  return JSONArray.toJSONString(collections);
	  }/////////////select
	  
	  //옆에 하나 선택
	  @RequestMapping(value= "/security/where/map/near.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
	  @ResponseBody
	  public String near(Model model,@RequestParam Map map,HttpServletResponse response,@RequestParam(value="mylat") String mylats,@RequestParam(value="mylon") String mylons) throws Exception{
		  List<StoreLocationDTO> lists = storelocservice.selectList(map);
	      List<Map> collections = new Vector<Map>();
    
		  for(StoreLocationDTO list:lists) {
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
		         
		         //반경 계산
		         
		         double diskill = 0;
		         double mylat = Double.parseDouble(mylats);
		         double mylon = Double.parseDouble(mylons);
		         diskill = LocationDistance(mylat,mylon,Double.parseDouble(record.get("lat").toString()),Double.parseDouble(record.get("lon").toString()));
		         
		         record.put("diskill", String.format("%.1f" , diskill));

		         if(diskill<=2.0) {
		        	 collections.add(record);
		         }
		      }////for
		  return JSONArray.toJSONString(collections);
	  }/////////////near
	  
	  //옆에 하나 선택
	  @RequestMapping(value= "/security/where/map/nearselect.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
	  @ResponseBody
	  public String nearselect(Model model,@RequestParam Map map,HttpServletResponse response,@RequestParam(value="mylat") String mylats,@RequestParam(value="mylon") String mylons) throws Exception{
		  String[] codes = ((String)map.get("indssclscd")).split(" ");
		  List<Map> collections = new Vector<Map>();
		  for(String code : codes) {
			  map.put("indssclscd", code);
			  List<StoreLocationDTO> lists =  storelocservice.selectList(map);
			  for(StoreLocationDTO list:lists) {
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
		         
		         //반경 계산
		         
		         double diskill = 0;
		         double mylat = Double.parseDouble(mylats);
		         double mylon = Double.parseDouble(mylons);
		         diskill = LocationDistance(mylat,mylon,Double.parseDouble(record.get("lat").toString()),Double.parseDouble(record.get("lon").toString()));
		         
		         record.put("diskill", String.format("%.1f" , diskill));

		         if(diskill<=10.0) {
		        	 collections.add(record);
		         }
		      }////inner for
		  }////outter for	  
		  return JSONArray.toJSONString(collections);
	  }/////////////near
	  
	  public double LocationDistance(double mylat,double mylon,double otherlat,double otherlon) {
		        // 마일(Mile) 단위
//		        double distanceMile =
//		            distance(37.504198, 127.047967, 37.501025, 127.037701, "");
		         
		        // 미터(Meter) 단위
//		        double distanceMeter =
//		            distance(37.504198, 127.047967, 37.501025, 127.037701, "meter");
		         
		        // 킬로미터(Kilo Meter) 단위
		        double distanceKiloMeter =
		            distance(mylat,mylon,otherlat,otherlon, "kilometer");
		         
//		        System.out.println(distanceMile);
//		        System.out.println(distanceMeter);
		    /**
		     * 두 지점간의 거리 계산
		     *
		     * @param lat1 지점 1 위도
		     * @param lon1 지점 1 경도
		     * @param lat2 지점 2 위도
		     * @param lon2 지점 2 경도
		     * @param unit 거리 표출단위
		     * @return
		     */
				return distanceKiloMeter;
		}
	  	double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
	         
	        double theta = lon1 - lon2;
	        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
	         
	        dist = Math.acos(dist);
	        dist = rad2deg(dist);
	        dist = dist * 60 * 1.1515;
	         
	        if (unit == "kilometer") {
	            dist = dist * 1.609344;
	        } else if(unit == "meter"){
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
	    //예약 페이지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ
	    @RequestMapping("/where/reservation.awa")
	    public String reservation_write_form(Model model,@RequestParam Map map)throws Exception {
	    	model.addAttribute("store_no",map.get("store_no"));
	    	model.addAttribute("bizesNm",map.get("bizesNm"));
			//뷰정보 반환]
			return "where/reservationMain.tiles";
	    }//reservation_write_form
	    @RequestMapping("/where/reservate.awa")
	    public String reservate(Model model,@RequestParam Map map,HttpSession session)throws Exception {
	    	map.put("mem_no", session.getAttribute("mem_no"));
	    	int insert = reservationservice.insert(map);
	    	if (insert == 1)
				model.addAttribute("check", 1);
			else
				model.addAttribute("check", 0);
	    	//뷰정보 반환]
	    	return "where/Message";
	    } //reservate
	    @RequestMapping("/where/reservation_check.aw")
	    public String reservate_check(Model model,@RequestParam Map map,HttpSession session)throws Exception {
	    	List<ReservationDTO> list = reservationservice.selectList(map);
	    	model.addAttribute("list",list);
	    	//뷰정보 반환]
	    	return "where/reservation_list.tiles";
	    }//reservate_check
//	  @RequestMapping(value= "/where/map/radius.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
//	  @ResponseBody
//	  public String  mapdata(@RequestParam Map map,HttpServletResponse response) throws Exception{
//		  JSONObject jsonObj =  new JSONObject();
//		  	String[] codes = ((String)map.get("code")).split("/");
//		  	for(String code : codes) {
//				String API_URL = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=2000&type=json&cx="+map.get("lon")+"&cy="+map.get("lat")+"&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
//				HttpURLConnection conn = (HttpURLConnection) new URL(API_URL).openConnection();
//				conn.setRequestMethod("GET");
//				int responseCode = conn.getResponseCode();
//				if(responseCode != 200) {
//					System.err.println("연결 실패: " + responseCode);
//					System.err.println("실패 코드 값 : "+ code);
//					continue;
//				}
//				String line;
//				StringBuilder json = new StringBuilder();
//				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//				while((line= br.readLine())!=null) {
//					json.append(line+System.getProperty("line.separator"));
//				}
//				br.close();
//				conn.disconnect();
//				//String result = URLEncoder.encode(json.toString() , "UTF-8");
//				String result = json.toString();
//				jsonObj.put(code, result);
//		  	}
//			return jsonObj.toJSONString();
//	  }//////////////mapdata

	  
	  //임의의 메소드 (사용하지ㅏㄶ음)
//	  @RequestMapping(value= "/where/map/D09A01.aw", method= RequestMethod.POST)
//	  @ResponseBody
//	  public String  d09a01(@RequestParam Map map,HttpServletResponse response) throws Exception{
//		  JSONObject jsonObj =  new JSONObject();
//		  
//			String API_URL = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInUpjong?divId=indsSclsCd&pageNo=2&key=D09A01&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
//			HttpURLConnection conn = (HttpURLConnection) new URL(API_URL).openConnection();
//			conn.setRequestMethod("GET");
//			int responseCode = conn.getResponseCode();
//			if(responseCode != 200) {
//				System.err.println("연결 실패: " + responseCode);
//				System.exit(1);
//			}
//			String line;
//			StringBuilder json = new StringBuilder();
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			while((line= br.readLine())!=null) {
//				json.append(line+System.getProperty("line.separator"));
//			}
//			br.close();
//			conn.disconnect();
//			System.out.println(json);
//			String result = URLEncoder.encode(json.toString() , "UTF-8");
//			return result;
//	  }//////////////
	    
}
