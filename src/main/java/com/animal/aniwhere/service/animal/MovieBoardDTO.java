package com.animal.aniwhere.service.animal;

public class MovieBoardDTO {

	private String no; //영상 넘버
	private String mem_no; //멤버 넘버
	private String movie_title; //영상 제목 : value는 50이상 쓸 수 없음
	private String movie_count; //조회 수
	private String movie_content; //동영상 및 내용
	private String movie_hit; //추천 수
	private java.sql.Date movie_regidate; //동영상 등록 날짜
	private String ani_category; // 동물 카테고리

	// 영상 링크 저장을 위한 속성 추가
	private String movie_tempsrc;
	
	// 작성자의 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getMovie_title() {
		return movie_title;
	}//////////

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}//////////

	public String getMovie_count() {
		return movie_count;
	}//////////

	public void setMovie_count(String movie_count) {
		this.movie_count = movie_count;
	}//////////

	public String getMovie_content() {
		return movie_content;
	}//////////

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}//////////

	public String getMovie_hit() {
		return movie_hit;
	}//////////

	public void setMovie_hit(String movie_hit) {
		this.movie_hit = movie_hit;
	}//////////

	public java.sql.Date getMovie_regidate() {
		return movie_regidate;
	}//////////

	public void setMovie_regidate(java.sql.Date movie_regidate) {
		this.movie_regidate = movie_regidate;
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

	public String getMovie_tempsrc() {
		return movie_tempsrc;
	}//////////

	public void setMovie_tempsrc(String movie_tempsrc) {
		this.movie_tempsrc = movie_tempsrc;
	}//////////

	public String getNo() {
		return no;
	}//////////

	public void setNo(String no) {
		this.no = no;
	}//////////
	
}//////////////////// MovieBoardDTO class
