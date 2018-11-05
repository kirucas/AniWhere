package com.animal.aniwhere.service;

public class ReservationDTO {

	private String rv_no;
	private String mem_no;
	private String store_no;
	private java.sql.Date apply_date; // 신청일
	private java.sql.Date booking_date; // 예약일
	
	private String qr_link; // QR Code 이미지 링크
	// 신청자의 이름 저장을 위한 속성 추가
	private String mem_name;
	// 신청한 상가명을 저장하기 위한 속성 추가
	private String bizesnm;
	private String brchnm;

	public String getRv_no() {
		return rv_no;
	}//////////

	public void setRv_no(String rv_no) {
		this.rv_no = rv_no;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getStore_no() {
		return store_no;
	}//////////

	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}//////////

	public java.sql.Date getApply_date() {
		return apply_date;
	}//////////

	public void setApply_date(java.sql.Date apply_date) {
		this.apply_date = apply_date;
	}//////////

	public java.sql.Date getBooking_date() {
		return booking_date;
	}//////////

	public void setBooking_date(java.sql.Date booking_date) {
		this.booking_date = booking_date;
	}//////////

	public String getMem_name() {
		return mem_name;
	}//////////

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}//////////

	public String getBizesnm() {
		return bizesnm;
	}//////////

	public void setBizesnm(String bizesnm) {
		this.bizesnm = bizesnm;
	}//////////

	public String getBrchnm() {
		return brchnm;
	}//////////

	public void setBrchnm(String brchnm) {
		this.brchnm = brchnm;
	}//////////

	public String getQr_link() {
		return qr_link;
	}//////////

	public void setQr_link(String qr_link) {
		this.qr_link = qr_link;
	}//////////

}//////////////////// ReservationDTO class
