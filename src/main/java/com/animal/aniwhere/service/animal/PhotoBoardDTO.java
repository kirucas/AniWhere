package com.animal.aniwhere.service.animal;

public class PhotoBoardDTO {

	private String photo_no;
	private String mem_no;
	private String photo_title;
	private String photo_count;
	private String photo_content;
	private String photo_hit;
	private java.sql.Date photo_regidate;
	
	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getPhoto_no() {
		return photo_no;
	}//////////

	public void setPhoto_no(String photo_no) {
		this.photo_no = photo_no;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getPhoto_title() {
		return photo_title;
	}//////////

	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}//////////

	public String getPhoto_count() {
		return photo_count;
	}//////////

	public void setPhoto_count(String photo_count) {
		this.photo_count = photo_count;
	}//////////

	public String getPhoto_content() {
		return photo_content;
	}//////////

	public void setPhoto_content(String photo_content) {
		this.photo_content = photo_content;
	}//////////

	public String getPhoto_hit() {
		return photo_hit;
	}//////////

	public void setPhoto_hit(String photo_hit) {
		this.photo_hit = photo_hit;
	}//////////

	public java.sql.Date getPhoto_regidate() {
		return photo_regidate;
	}//////////

	public void setPhoto_regidate(java.sql.Date photo_regidate) {
		this.photo_regidate = photo_regidate;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////
	
}//////////////////// PhotoBoardDTO class
