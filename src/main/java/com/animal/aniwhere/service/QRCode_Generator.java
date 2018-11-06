package com.animal.aniwhere.service;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.animal.aniwhere.service.impl.StoreLocationServiceImpl;
import com.animal.aniwhere.service.impl.member.AndroidTokenServiceImpl;
import com.animal.aniwhere.service.impl.member.MemberServiceImpl;
import com.animal.aniwhere.service.member.MemberDTO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRCode_Generator {

	public static String createQRCodeImage(String codeDataString, File path, String fileType) {

		File qr_code_name = new File(path.getAbsolutePath() + File.separator + AwsS3Utils.namingForS3("QRCodes") + "." + fileType);
		
		if(!qr_code_name.getParentFile().exists())
			qr_code_name.getParentFile().mkdirs();
		
		int size = 150;
		
		String qr_link = "";

		try {

			HashMap<EncodeHintType, Object> hintMap = new HashMap<>();

			hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");

			hintMap.put(EncodeHintType.MARGIN, 1);
			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(codeDataString, BarcodeFormat.QR_CODE, size, size, hintMap);

			int bitWidth = bitMatrix.getWidth();

			BufferedImage image = new BufferedImage(bitWidth, bitWidth, BufferedImage.TYPE_INT_RGB);
			image.createGraphics();

			Graphics2D graphics = (Graphics2D) image.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, bitWidth, bitWidth);
			graphics.setColor(Color.BLACK);
			
			for(int i=0; i<bitWidth;i++) {
				for(int j=0;j<bitWidth;j++) {
					if(bitMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}
			
			ImageIO.write(image, fileType, qr_code_name);
			
			qr_link = AwsS3Utils.s3PutObject(qr_code_name.getAbsolutePath(), "QRCodes");
			
			System.out.println("qr_link : " + qr_link);

		} catch (Exception e) {
			e.printStackTrace();
			return qr_link;
		}

		return qr_link;
	}////////// 
	
	public static String createQRCodeData(Map map, HttpServletRequest req, StoreLocationServiceImpl storeService, MemberServiceImpl memberService) {
		
		map.put("bizesid", map.get("store_no"));
		
		System.out.println("bizesid : " + map.get("bizesid"));
		System.out.println("store_no : " + map.get("store_no"));
		
		StoreLocationDTO storeDTO = storeService.selectOne(map);
		MemberDTO memDTO = memberService.selectOne(map);
		
		JSONObject json = new JSONObject();
		
		json.put("name", memDTO.getMem_name());
		json.put("store_name", storeDTO.getBizesnm() + (storeDTO.getBrchnm() != null ? (" " + storeDTO.getBrchnm()) : "") + (storeDTO.getDongno() != null ? (" " + storeDTO.getDongno()) : "") + (storeDTO.getFlrno() != null ? (" " + storeDTO.getFlrno()) : "") + (storeDTO.getHono() != null ? (" " + storeDTO.getHono()) : ""));
		json.put("apply_date", new java.sql.Date(new java.util.Date().getTime()));
		json.put("booking_date", map.get("booking_date"));
		json.put("location", storeDTO.getRdnmadr());
		json.put("mem_no", memDTO.getMem_no()); 
		
		System.out.println("json : " + json.toString());
		System.out.println("bizesnm : " + storeDTO.getBizesnm());
		System.out.println("brchnm : " + storeDTO.getBrchnm());
		
		File path = new File(req.getServletContext().getRealPath("/Upload"));
		String fileType = "png";
		
		return createQRCodeImage(json.toJSONString(), path, fileType);
	}//////////

}//////////////////// QRCode_Generator class
