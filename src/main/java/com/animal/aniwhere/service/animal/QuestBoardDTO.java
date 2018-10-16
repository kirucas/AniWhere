package com.animal.aniwhere.service.animal;

public class QuestBoardDTO {

	private String quest_no;
	private String mem_no;
	private String quest_title;
	private String quest_content;
	private String quest_hit;
	private java.sql.Date quest_regidate;
	private String quest_count;
	private String origin_no;
	
	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getQuest_no() {
		return quest_no;
	}//////////

	public void setQuest_no(String quest_no) {
		this.quest_no = quest_no;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getQuest_title() {
		return quest_title;
	}//////////

	public void setQuest_title(String quest_title) {
		this.quest_title = quest_title;
	}//////////

	public String getQuest_content() {
		return quest_content;
	}//////////

	public void setQuest_content(String quest_content) {
		this.quest_content = quest_content;
	}//////////

	public String getQuest_hit() {
		return quest_hit;
	}//////////

	public void setQuest_hit(String quest_hit) {
		this.quest_hit = quest_hit;
	}//////////

	public java.sql.Date getQuest_regidate() {
		return quest_regidate;
	}//////////

	public void setQuest_regidate(java.sql.Date quest_regidate) {
		this.quest_regidate = quest_regidate;
	}//////////

	public String getQuest_count() {
		return quest_count;
	}//////////

	public void setQuest_count(String quest_count) {
		this.quest_count = quest_count;
	}//////////

	public String getOrigin_no() {
		return origin_no;
	}//////////

	public void setOrigin_no(String origin_no) {
		this.origin_no = origin_no;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////
	
}//////////////////// QuestBoardDTO class
