package com.animal.aniwhere.web.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartRequest;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	
	public static MultipartRequest upload(HttpServletRequest req,String uploadPath) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req,
										uploadPath,
										1024*500,
										"UTF-8",
										new DefaultFileRenamePolicy());
		}catch(Exception e) {e.printStackTrace();}
		return mr;
	}//////////////upload
	//파일 삭제 로직]
	public static void deleteFile(HttpServletRequest req,
			String uploadDirectory, 
			String filename) {
		//서버의 물리적 경로 얻기]
		String saveDirectory =req.getServletContext().getRealPath(uploadDirectory);
		//파일 객체 생성]
		File file = new File(saveDirectory+File.separator+filename);
		//파일 존재 여부 판단후 삭제
		if(file.exists()) {
			file.delete();
		}////////if
		
	}/////////////deleteFile
	//파일 다운로드 로직]
	public static void download(HttpServletRequest request, HttpServletResponse response,String uploadDirectory,String filename) {
		String saveDirectory = request.getServletContext().getRealPath(uploadDirectory);
		File file = new File(saveDirectory+File.separator+filename);
		long length=file.length();
		response.setContentType("application/octet-stream");
		response.setContentLengthLong(length);

		boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 ||
						request.getHeader("user-agent").indexOf("11.0") !=-1;
			try {
			if(isIe){//인터넷 익스플로러
				filename = URLEncoder.encode(filename,"utf-8");
			}
			else{//기타 웹브라우저
				filename = new String(filename.getBytes("UTF-8"),"8859_1");
			}
			response.setHeader("Content-Disposition","attachment; filename="+filename);
	
			BufferedInputStream bis = 
				new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = 
				new BufferedOutputStream(response.getOutputStream());
			int data;
			while((data=bis.read())!=-1){
				bos.write(data);
				bos.flush();
			}
			//8]스트림 닫기
			bis.close();
			bos.close();
			}
			catch(Exception e) {e.printStackTrace();}
	}/////////////////////////////
	
}
