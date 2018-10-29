package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.StoreLocationDTO;

@Repository
public class StoreLocationDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<StoreLocationDTO> selectList(Map map) {
		return template.selectList("storeSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("storeCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public StoreLocationDTO selectOne(Map map) {
		return template.selectOne("storeSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("storeInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("storeUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("storeDelete", map);
	}////////// delete

}//////////////////// StoreLocationDAO class
