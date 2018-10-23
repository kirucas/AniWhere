package com.animal.aniwhere.service.animal;

public class TipBoardDTO {

	private String tip_no;
	private String mem_no;
	private String tip_title;
	private String tip_content;
	private String tip_hit;
	private java.sql.Date tip_regidate;
	private String tip_count;
	private String ani_category;
	
	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getTip_no() {
		return tip_no;
	}//////////

	public void setTip_no(String tip_no) {
		this.tip_no = tip_no;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getTip_title() {
		return tip_title;
	}//////////

	public void setTip_title(String tip_title) {
		this.tip_title = tip_title;
	}//////////

	public String getTip_content() {
		return tip_content;
	}//////////

	public void setTip_content(String tip_content) {
		this.tip_content = tip_content;
	}//////////

	public String getTip_hit() {
		return tip_hit;
	}//////////

	public void setTip_hit(String tip_hit) {
		this.tip_hit = tip_hit;
	}//////////

	public java.sql.Date getTip_regidate() {
		return tip_regidate;
	}//////////

	public void setTip_regidate(java.sql.Date tip_regidate) {
		this.tip_regidate = tip_regidate;
	}//////////

	public String getTip_count() {
		return tip_count;
	}//////////

	public void setTip_count(String tip_count) {
		this.tip_count = tip_count;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////

	public String getAni_category() {
		return ani_category;
	}//////////

	public void setAni_category(String ani_category) {
		this.ani_category = ani_category;
	}//////////
	
}//////////////////// TipBoardDTO class
