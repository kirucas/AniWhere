package com.animal.aniwhere.web.board;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
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

}
