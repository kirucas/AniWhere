package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllBoardService;

@Repository
public class DraftingDAO implements AllBoardService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("draftingList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("draftingCount", map);
	}////////// getTotalRecord

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map selectOne(Map map) {
		return template.selectOne("draftingOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("draftingInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.update("draftingUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("draftingDelete", map);
	}////////// delete

	@Override
	public int addHitCount(Map map) {
		return 0;
	}////////// addHitCount

}//////////////////// DraftingDAO
