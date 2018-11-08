package com.animal.aniwhere.service;

public class AllCommentDTO {

	private String cmt_no; //코멘트 넘버
	private String origin_no;
	private String mem_no;
	private String cmt_content;
	private String hit;
	private java.sql.Date regidate;

	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getCmt_no() {
		return cmt_no;
	}//////////

	public void setCmt_no(String cmt_no) {
		this.cmt_no = cmt_no;
	}//////////

	public String getOrigin_no() {
		return origin_no;
	}//////////

	public void setOrigin_no(String origin_no) {
		this.origin_no = origin_no;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getCmt_content() {
		return cmt_content;
	}//////////

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}//////////

	public String getHit() {
		return hit;
	}//////////

	public void setHit(String hit) {
		this.hit = hit;
	}//////////

	public java.sql.Date getRegidate() {
		return regidate;
	}//////////

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////

}//////////////////// PhotoCommentDTO class
