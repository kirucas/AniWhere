package com.animal.aniwhere.service;

import java.io.File;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Vector;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectsRequest;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.animal.aniwhere.web.board.FileUpDownUtils;

// Amazon Wep Service S3 (저장소 서비스) 사용 클래스
public class AwsS3Utils {
	// AWS 업로드용 자원
	public static final String BUCKET_NAME="aniwhere"; // s3 버킷(저장소)이름
	public static final String END_POINT="http://aniwhere.s3-website.ap-northeast-2.amazonaws.com";
	public static final String LINK_ADDRESS="https://s3.ap-northeast-2.amazonaws.com/aniwhere/";
	public static final String SECRETKEY="7tIbEVzAbEhJ+BlFD98lNyafyQkD2JPXk+rmVYsg";
	public static final String ACCESSKEY="AKIAJ226IPRT7YZGBJMA";
	private static AWSCredentials creds;
	private static AmazonS3 s3Client;

	static {
		// 인증
		creds= new BasicAWSCredentials(ACCESSKEY, SECRETKEY);
		// set region
		s3Client = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(creds))
                .withRegion(Regions.AP_NORTHEAST_2)
                .build();
	}//// static block
	
	////////////////////////////////////////////
	// S3에 파일 업로드는 이 메소드만 호출하면 되도록 만들었으니 잘 해보십시오
	// 첫번째 인자 : mhsr, 두번째 인자 : 카테고리명(폴더명)
	public static List<String> uploadFileToS3(MultipartHttpServletRequest mhsr,String category) {
		List<String> uploadedFileNames=new Vector<>();
		
		String physicalPath = mhsr.getServletContext().getRealPath("/Upload");
		// Upload 폴더가 없을 시 생성
		File uploadDir=new File(physicalPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		// 본격적으로 파일을 받는다
		Iterator<String> files=mhsr.getFileNames();
		while(files.hasNext()) {
			String uploadFile=files.next();
			List<MultipartFile> uploads=mhsr.getFiles(uploadFile);
			for(MultipartFile upload:uploads) {
				System.out.println(upload.getOriginalFilename());
				String newFilename = FileUpDownUtils.getNewFileName(physicalPath, upload.getOriginalFilename());
				System.out.println("파일 이름:"+newFilename);
				try {
					upload.transferTo(new File(physicalPath+File.separator+newFilename));
					String uploadedFileName=s3PutObject(physicalPath+File.separator+newFilename,category);
					uploadedFileNames.add(uploadedFileName);
					s3ReadObjects();
				} catch (Exception e) { e.printStackTrace();}
			}/// for
		}/// while
		// 업로드 성공한 파일들의 이름을 List로 반환
		return uploadedFileNames;
	}///uploadFileToS3
	///////////////////////////////////////////
	
	// AWS s3 업로드 메소드
	public static String s3PutObject(String file_path, String category) {
        String key_name = category+"/"+"AniwhereImg"+System.nanoTime()+"seed"+new Random().nextInt(9999);

        System.out.format("Uploading %s to S3 bucket %s...\n", file_path, BUCKET_NAME);
        try {
        	// 업로드
            //s3.putObject(BUCKET_NAME, key_name, new File(file_path));
            PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET_NAME,key_name, new File(file_path));
			putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
			s3Client.putObject(putObjectRequest);
        } catch (AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
            System.exit(1);
        }
        System.out.println("Done!");
        return key_name;
	}/// putObject
	
	// 버킷에서 파일 목록 불러오기
	public static void s3ReadObjects() {
	    System.out.format("Objects in S3 bucket %s:\n", BUCKET_NAME);
	    ListObjectsV2Result result = s3Client.listObjectsV2(BUCKET_NAME);
	    List<S3ObjectSummary> objects = result.getObjectSummaries();
	    for (S3ObjectSummary os: objects) {
	        System.out.println("* " + os.getKey());
	    }
	}/// readObjects
	
	// 버킷에서 파일 삭제하기
	public static boolean deleteFileFromS3(String key_name) {
		System.out.format("Deleting object %s from S3 bucket: %s\n", key_name,BUCKET_NAME);
		
        try {
            s3Client.deleteObject(BUCKET_NAME,key_name);
        } catch (AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
            return false;
        }
        System.out.println("Delete Done!");
        // 현재 파일 목록 출력
        s3ReadObjects();
		return true;
	}/// deleteFileFromS3
	
	// 문자열 배열을 넣어 한번에 삭제하는 메소드
	public static boolean deleteFileFromS3(String[] key_names) {
		int result=0;
		System.out.println("Deleting objects from S3 bucket: " + BUCKET_NAME);
        for (String k : key_names)
            System.out.println(" * " + k);
        
        try {
            DeleteObjectsRequest dor = new DeleteObjectsRequest(BUCKET_NAME).withKeys(key_names);
            s3Client.deleteObjects(dor);
        } catch (AmazonServiceException e) {
            System.err.println(e.getErrorMessage());
            return false;
        }
        System.out.println("Delete Done!");
        // 현재 파일 목록 출력
        s3ReadObjects();
        return true;
	}/// deleteFileFromS3
}/// class
