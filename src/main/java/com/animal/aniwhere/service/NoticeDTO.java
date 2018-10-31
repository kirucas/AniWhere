package com.animal.aniwhere.service;

public class NoticeDTO {

	private String no;
	private String am_no;
	private String title;
	private String content;
	private java.sql.Date regidate;
	private String count;
	private String depth;
	// 작성자 아이디를 저장하기 위한 속성 추가
	private String am_id;

	public String getNo() {
		return no;
	}//////////

	public void setNo(String no) {
		this.no = no;
	}//////////

	public String getAm_no() {
		return am_no;
	}//////////

	public void setAm_no(String am_no) {
		this.am_no = am_no;
	}//////////

	public String getTitle() {
		return title;
	}//////////

	public void setTitle(String title) {
		this.title = title;
	}//////////

	public String getContent() {
		return content;
	}//////////

	public void setContent(String content) {
		this.content = content;
	}//////////

	public java.sql.Date getRegidate() {
		return regidate;
	}//////////

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}//////////

	public String getCount() {
		return count;
	}//////////

	public void setCount(String count) {
		this.count = count;
	}//////////

	public String getAm_id() {
		return am_id;
	}//////////

	public void setAm_id(String am_id) {
		this.am_id = am_id;
	}//////////
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
}//////////////////// NoticeDTO class
