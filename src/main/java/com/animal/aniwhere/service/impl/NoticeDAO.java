package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.NoticeDTO;

@Repository
public class NoticeDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<NoticeDTO> selectList(Map map) {
		return template.selectList("noticeSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("noticeCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public NoticeDTO selectOne(Map map) {
		template.update("addCountNotice", map);
		return template.selectOne("noticeSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("noticeInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("noticeUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("noticeDelete", map);
	}////////// delete

}//////////////////// NoticeDAO class
