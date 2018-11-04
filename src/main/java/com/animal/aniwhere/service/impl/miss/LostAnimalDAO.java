package com.animal.aniwhere.service.impl.miss;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.miss.LostAnimalDTO;

@Repository
public class LostAnimalDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<LostAnimalDTO> selectList(Map map) {
		return template.selectList("lostSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("lostCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public LostAnimalDTO selectOne(Map map) {
		return template.selectOne("lostSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("lostInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("lostUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("lostDelete", map);
	}////////// delete
	
	public int passDateOnNotice() {
		return template.delete("passDateOnNotice");
	}////////// passDateOnNotice

}//////////////////// LostAnimalDAO class
