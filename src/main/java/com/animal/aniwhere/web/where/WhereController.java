package com.animal.aniwhere.web.where;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.StoreLocationDTO;

@Controller
public class WhereController {
	 
	@Resource(name="StoreLocService")
	private AllCommonService storelocservice;
	
	  @RequestMapping("/where/main.aw")
	  public String where_main() throws Exception {
	      return "where/whereMain.tiles";
	  }////////// mating_main
	  
	  //전체 갖고오기 ajax
	  @RequestMapping(value= "/where/map/total.awa", method= RequestMethod.POST)
	  @ResponseBody
	  public String  whole(@RequestParam Map map,HttpServletResponse response) throws Exception{
		  
		  List<StoreLocationDTO> lists = (List<StoreLocationDTO>) storelocservice.selectList(map);
		  
			String API_URL = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInUpjong?divId=indsSclsCd&pageNo=2&key=D09A01&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
			HttpURLConnection conn = (HttpURLConnection) new URL(API_URL).openConnection();
			conn.setRequestMethod("GET");
			int responseCode = conn.getResponseCode();
			if(responseCode != 200) {
				System.err.println("연결 실패: " + responseCode);
				System.exit(1);
			}
			String line;
			StringBuilder json = new StringBuilder();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while((line= br.readLine())!=null) {
				json.append(line+System.getProperty("line.separator"));
			}
			br.close();
			conn.disconnect();
			System.out.println(json);
			String result = URLEncoder.encode(json.toString() , "UTF-8");
			return result;
	  }/////////////whole
	  
	  
	  
	  @RequestMapping(value= "/where/map/radius.awa", method= RequestMethod.POST,produces="text/plain; charset=UTF-8")
	  @ResponseBody
	  public String  mapdata(@RequestParam Map map,HttpServletResponse response) throws Exception{
		  JSONObject jsonObj =  new JSONObject();
		  	String[] codes = ((String)map.get("code")).split("/");
		  	for(String code : codes) {
				String API_URL = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=2000&type=json&cx="+map.get("lon")+"&cy="+map.get("lat")+"&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
				HttpURLConnection conn = (HttpURLConnection) new URL(API_URL).openConnection();
				conn.setRequestMethod("GET");
				int responseCode = conn.getResponseCode();
				if(responseCode != 200) {
					System.err.println("연결 실패: " + responseCode);
					System.err.println("실패 코드 값 : "+ code);
					continue;
				}
				String line;
				StringBuilder json = new StringBuilder();
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while((line= br.readLine())!=null) {
					json.append(line+System.getProperty("line.separator"));
				}
				br.close();
				conn.disconnect();
				//String result = URLEncoder.encode(json.toString() , "UTF-8");
				String result = json.toString();
				jsonObj.put(code, result);
		  	}
			return jsonObj.toJSONString();
	  }//////////////mapdata
	  

	  
	  //임의의 메소드 (사용하지ㅏㄶ음)
	  @RequestMapping(value= "/where/map/D09A01.aw", method= RequestMethod.POST)
	  @ResponseBody
	  public String  d09a01(@RequestParam Map map,HttpServletResponse response) throws Exception{
		  JSONObject jsonObj =  new JSONObject();
		  
			String API_URL = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInUpjong?divId=indsSclsCd&pageNo=2&key=D09A01&ServiceKey=snZhl9X76KcGuXrNuvglRr41nB8iUW9CZ%2F96V4aVUEANTSVsQOIeOM1o7f2cxlsD%2BBOcP%2BElAe12PhHaKfRyTA%3D%3D";
			HttpURLConnection conn = (HttpURLConnection) new URL(API_URL).openConnection();
			conn.setRequestMethod("GET");
			int responseCode = conn.getResponseCode();
			if(responseCode != 200) {
				System.err.println("연결 실패: " + responseCode);
				System.exit(1);
			}
			String line;
			StringBuilder json = new StringBuilder();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while((line= br.readLine())!=null) {
				json.append(line+System.getProperty("line.separator"));
			}
			br.close();
			conn.disconnect();
			System.out.println(json);
			String result = URLEncoder.encode(json.toString() , "UTF-8");
			return result;
	  }//////////////mapdata
	  
	  @ResponseBody
	  @RequestMapping(value= "/android.awa", method= RequestMethod.POST)
	  public String android() throws Exception{
		  
		  
		  
		  
		  return null;
	  }
}
