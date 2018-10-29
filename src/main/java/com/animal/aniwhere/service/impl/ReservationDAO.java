package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.ReservationDTO;

@Repository
public class ReservationDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<ReservationDTO> selectList(Map map) {
		return template.selectList("reservationSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("reservationCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public ReservationDTO selectOne(Map map) {
		return template.selectOne("reservationSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("reservationInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("reservationUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("reservationDelete", map);
	}////////// delete

}//////////////////// ReservationDAO class
