package com.animal.aniwhere.web.board.animal.bird;

import java.io.File;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.animal.aniwhere.web.board.FileUpDownUtils;

@Controller
public class BirdPhotoController {
	//등록 폼으로 이동]
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.GET)
	public String write() throws Exception{
		return "board/animal/bird/photo/photo_write.tiles";
	}/// write
	
	// 등록 완료 후 리스트로 이동
	@ResponseBody
	@RequestMapping(value="/board/animal/bird/photo/write.aw",method=RequestMethod.POST)
	public String writeComplete(@RequestParam Map map,MultipartHttpServletRequest mhsr) throws Exception{
		Set<String> set=map.keySet();
		for(String key:set)	System.out.println("value:"+map.get(key));
		
		String phisicalPath = mhsr.getServletContext().getRealPath("/Upload");
		//MultipartFile upload = mhsr.getFile("files");
		Iterator<String> files=mhsr.getFileNames();
		while(files.hasNext()) {
			String uploadFile=files.next();
			MultipartFile upload=mhsr.getFile(uploadFile);
			String newFilename = FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
			System.out.println("파일 이름:"+newFilename);
			try {
				//upload.transferTo(new File(phisicalPath+File.separator+newFilename));
				putObject(phisicalPath+File.separator+newFilename);
				readObjects();
			} catch (Exception e) { e.printStackTrace();}
		}
		System.out.println("업로드으!");
        return "";
	}/// writeComplete
	
	// AWS s3 업로드 메소드
	public static final String BUCKET_NAME="aniwhere"; // s3 버킷(저장소)이름
	public static final String END_POINT="http://aniwhere.s3-website.ap-northeast-2.amazonaws.com";
	public void putObject(String file_path) {
        String key_name = Paths.get(file_path).getFileName().toString();

        System.out.format("Uploading %s to S3 bucket %s...\n", file_path, BUCKET_NAME);
        final AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();
        try {
        	// 업로드
            s3.putObject(BUCKET_NAME, key_name, new File(file_path));
        } catch (AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
            System.exit(1);
        }
        System.out.println("Done!");
	}/// putObject
	
	// 버킷에서 파일 목록 불러오기
	public void readObjects() {
	    System.out.format("Objects in S3 bucket %s:\n", BUCKET_NAME);
	    final AmazonS3 s3 = AmazonS3ClientBuilder.defaultClient();
	    ListObjectsV2Result result = s3.listObjectsV2(BUCKET_NAME);
	    List<S3ObjectSummary> objects = result.getObjectSummaries();
	    for (S3ObjectSummary os: objects) {
	        System.out.println("* " + os.getKey());
	    }
	}/// readObjects
	
}//////////////////// PhotoController class