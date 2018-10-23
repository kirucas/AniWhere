package com.animal.aniwhere.service.market;

public class GroupBuyingListDTO {

	private String buy_no;
	private String no;
	private String mem_no;
	private String buy_count;
	
	// 구매자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;
	
	public String getBuy_no() {
		return buy_no;
	}//////////
	
	public void setBuy_no(String buy_no) {
		this.buy_no = buy_no;
	}//////////
	
	public String getNo() {
		return no;
	}//////////
	
	public void setNo(String no) {
		this.no = no;
	}//////////
	
	public String getMem_no() {
		return mem_no;
	}//////////
	
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////
	
	public String getBuy_count() {
		return buy_count;
	}//////////
	
	public void setBuy_count(String buy_count) {
		this.buy_count = buy_count;
	}//////////
	
	public String getMem_nickname() {
		return mem_nickname;
	}//////////
	
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////
	
}//////////////////// GroupBuyingListDTO class
