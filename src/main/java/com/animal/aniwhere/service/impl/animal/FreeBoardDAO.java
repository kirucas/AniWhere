package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.animal.FreeBoardDTO;


@Repository
public class FreeBoardDAO implements AllBoardService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<FreeBoardDTO> selectList(Map map) {
		return template.selectList("freeSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("freeCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public FreeBoardDTO selectOne(Map map) {
		if(map.get("view") == null)
			template.update("addCountFree", map);
		return template.selectOne("freeSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("freeInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("freeUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("freeDelete", map);
	}////////// delete

	@Override
	public int addHitCount(Map map) {
		return template.update("addHitCountFree", map);
	}////////// addHitCount

}//////////////////// FreeBoardDAO class
