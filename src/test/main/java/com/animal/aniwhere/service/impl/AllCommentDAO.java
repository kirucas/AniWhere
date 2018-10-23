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
		map.put("table_name", map.get("page_name") + "_cmt"); // 페이지가 강아지의 사진 게시판인 경우 dog_bird의 형식으로 와야함
		return template.selectList("commentSelectList", map);
	}////////// selectList

	@Override
	public void insert(Map map) {
		map.put("table_name", map.get("page_name") + "_cmt");
		template.insert("commentInsert", map);
	}////////// insert

	@Override
	public void update(Map map) {
		map.put("table_name", map.get("page_name") + "_cmt");
		template.update("commentUpdate", map);
	}////////// update

	@Override
	public void delete(Map map) {
		map.put("table_name", map.get("page_name") + "_cmt");
		template.delete("commentDelete", map);
	}////////// delete

	@Override
	public int commentCount(Map map) {
		map.put("table_name", map.get("page_name") + "_cmt");
		return template.selectOne("commentCount", map);
	}////////// commentCount

}//////////////////// AllCommentDAO class
