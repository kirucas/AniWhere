package com.animal.aniwhere.service.animal;

public class MovieBoardDTO {

	private String movie_no;
	private String mem_no;
	private String movie_title;
	private String movie_count;
	private String movie_content;
	private String movie_hit;
	private java.sql.Date movie_regidate;
	
	//임시 선언(동영상 경로 받아 jsp에서 뿌려주기 위한 변수)
	private String movie_tempsrc;
	
	public String getMovie_tempsrc() {
		return movie_tempsrc;
	}

	public void setMovie_tempsrc(String movie_tempsrc) {
		this.movie_tempsrc = movie_tempsrc;
	}

	// 작성자의 별명을 저장하기 위한 속성 추가
	private String mem_nickname;

	public String getMovie_no() {
		return movie_no;
	}//////////

	public void setMovie_no(String movie_no) {
		this.movie_no = movie_no;
	}//////////

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
	
}//////////////////// MovieBoardDTO class
