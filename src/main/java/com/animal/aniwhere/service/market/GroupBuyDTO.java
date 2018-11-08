package com.animal.aniwhere.service.market;

public class GroupBuyDTO {

	private String no;
	private String animal_code;
	private String mem_no;
	private String title;
	private String content;
	private java.sql.Date regidate;
	private String count;
	private String goal;
	private java.sql.Date deadline;

	// 현재 판매 수량 저장을 위한 속성 추가
	private String buy_count;
	// 작성자 별명을 저장하기 위한 속성 추가
	private String mem_nickname;
	// 동물의 분류 명을 저장하기 위한 속성 추가
	private String animal_name;
	
	public String getNo() {
		return no;
	}//////////
	
	public void setNo(String no) {
		this.no = no;
	}//////////
	
	public String getAnimal_code() {
		return animal_code;
	}//////////
	
	public void setAnimal_code(String animal_code) {
		this.animal_code = animal_code;
	}//////////
	
	public String getMem_no() {
		return mem_no;
	}//////////
	
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
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
	
	public String getBuy_count() {
		return buy_count;
	}//////////
	
	public void setBuy_count(String buy_count) {
		this.buy_count = buy_count;
	}//////////
	
	public java.sql.Date getDeadline() {
		return deadline;
	}//////////
	
	public void setDeadline(java.sql.Date deadline) {
		this.deadline = deadline;
	}//////////
	
	public String getMem_nickname() {
		return mem_nickname;
	}//////////
	
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////
	
	public String getAnimal_name() {
		return animal_name;
	}//////////
	
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}//////////

	public String getGoal() {
		return goal;
	}//////////

	public void setGoal(String goal) {
		this.goal = goal;
	}//////////
	
}//////////////////// GroupBuyBoardDTO class
