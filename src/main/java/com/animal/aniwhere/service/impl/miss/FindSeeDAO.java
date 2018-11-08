package com.animal.aniwhere.service.impl.miss;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.miss.FindSeeDTO;

@Repository
public class FindSeeDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Override
	public List<FindSeeDTO> selectList(Map map) {
		return template.selectList("fsSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("fsCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public FindSeeDTO selectOne(Map map) {
		if(map.get("view") == null)
			template.update("addCountFS", map);
		return template.selectOne("fsSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("fsInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("fsUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("fsDelete", map);
	}////////// delete

}//////////////////// FindDAO class
