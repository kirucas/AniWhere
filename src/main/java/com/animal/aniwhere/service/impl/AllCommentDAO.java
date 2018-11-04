package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AllCommentService;

@Repository
public class AllCommentDAO implements AllCommentService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<AllCommentDTO> selectList(Map map) {
		return template.selectList("commentSelectList", map);
	}////////// selectList

	@Override
	public void insert(Map map) {
		template.insert("commentInsert", map);
	}////////// insert

	@Override
	public void update(Map map) {
		template.update("commentUpdate", map);
	}////////// update

	@Override
	public void delete(Map map) {
		template.delete("commentDelete", map);
	}////////// delete

	@Override
	public int commentCount(Map map) {
		return template.selectOne("commentCount", map);
	}////////// commentCount

	@Override
	public int addHitCountComment(Map map) {
		return template.update("addHitCountComment", map);
	}////////// addHitCountComment

}//////////////////// AllCommentDAO class
