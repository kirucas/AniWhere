package com.animal.aniwhere.service;

public class MatingDTO {

	private String mating_no;
	private String ani_no;
	private String mating_loc;
	private java.sql.Date mating_regidate;

	// 해당 동물의 정보를 저장하기 위한 속성 추가
	private String ani_name;
	private String ani_age;
	private String ani_species;
	private String ani_kind;
	private String ani_pic;

	// 해당 동물의 주인 정보
	private String mem_no;
	private String mem_nickname;

	public String getMating_no() {
		return mating_no;
	}//////////

	public void setMating_no(String mating_no) {
		this.mating_no = mating_no;
	}//////////

	public String getAni_no() {
		return ani_no;
	}//////////

	public void setAni_no(String ani_no) {
		this.ani_no = ani_no;
	}//////////

	public String getMating_loc() {
		return mating_loc;
	}//////////

	public void setMating_loc(String mating_loc) {
		this.mating_loc = mating_loc;
	}//////////

	public java.sql.Date getMating_regidate() {
		return mating_regidate;
	}//////////

	public void setMating_regidate(java.sql.Date mating_regidate) {
		this.mating_regidate = mating_regidate;
	}//////////

	public String getAni_name() {
		return ani_name;
	}//////////

	public void setAni_name(String ani_name) {
		this.ani_name = ani_name;
	}//////////

	public String getAni_age() {
		return ani_age;
	}//////////

	public void setAni_age(String ani_age) {
		this.ani_age = ani_age;
	}//////////

	public String getAni_species() {
		return ani_species;
	}//////////

	public void setAni_species(String ani_species) {
		this.ani_species = ani_species;
	}//////////

	public String getAni_kind() {
		return ani_kind;
	}//////////

	public void setAni_kind(String ani_kind) {
		this.ani_kind = ani_kind;
	}//////////

	public String getAni_pic() {
		return ani_pic;
	}//////////

	public void setAni_pic(String ani_pic) {
		this.ani_pic = ani_pic;
	}//////////

	public String getMem_no() {
		return mem_no;
	}//////////

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}//////////

	public String getMem_nickname() {
		return mem_nickname;
	}//////////

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}//////////

}//////////////////// MatinBoardDTO class
