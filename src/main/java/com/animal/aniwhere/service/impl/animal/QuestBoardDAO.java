package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.animal.QuestBoardDTO;


@Repository
public class QuestBoardDAO implements AllBoardService {

	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Override
	public List<QuestBoardDTO> selectList(Map map) {
		return template.selectList("questSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("questCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public QuestBoardDTO selectOne(Map map) {
		if(map.get("view") == null)
			template.update("addCountQuest", map);
		return template.selectOne("questSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("questInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("questUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("questDelete", map);
	}////////// delete
	
	@Override
	public int addHitCount(Map map) {
		return template.update("addHitCountQuest", map);
	}////////// addHitCount

}//////////////////// QuestBoardDAO class
