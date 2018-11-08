package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.member.AnimalDTO;


@Repository
public class MatingDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<MatingDTO> selectList(Map map) {
		return template.selectList("matingSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("matingCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MatingDTO selectOne(Map map) {
		return template.selectOne("matingSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("matingInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("matingUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("matingDelete", map);
	}////////// delete
	
	public List<AnimalDTO> selectMyMating(Map map){
		return template.selectList("selectMyMating", map);
	}////////// selectMyMating

}//////////////////// MatingBoardDAO
