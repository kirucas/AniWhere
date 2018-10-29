package com.animal.aniwhere.service.animal;

public class FreeBoardDTO {

	private String no;
	private String mem_no;
	private String free_title;
	private String free_content;
	private String free_hit;
	private java.sql.Date free_regidate;
	private String free_count;
	private String free_category;
	
	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getFree_title() {
		return free_title;
	}//////////

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}//////////

	public String getFree_content() {
		return free_content;
	}//////////

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}//////////

	public String getFree_hit() {
		return free_hit;
	}//////////

	public void setFree_hit(String free_hit) {
		this.free_hit = free_hit;
	}//////////

	public java.sql.Date getFree_regidate() {
		return free_regidate;
	}//////////

	public void setFree_regidate(java.sql.Date free_regidate) {
		this.free_regidate = free_regidate;
	}//////////

	public String getFree_count() {
		return free_count;
	}//////////

	public void setFree_count(String free_count) {
		this.free_count = free_count;
	}//////////

	public String getFree_category() {
		return free_category;
	}//////////

	public void setFree_category(String free_category) {
		this.free_category = free_category;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////

	public String getNo() {
		return no;
	}//////////

	public void setNo(String no) {
		this.no = no;
	}//////////
	
}//////////////////// FreeBoardDTO class
