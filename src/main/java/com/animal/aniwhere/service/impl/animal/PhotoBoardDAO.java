package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.animal.PhotoBoardDTO;
import com.animal.aniwhere.service.animal.PhotoService;


@Repository
public class PhotoBoardDAO implements PhotoService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<PhotoBoardDTO> selectList(Map map) {
		return template.selectList("photoSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("photoCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public PhotoBoardDTO selectOne(Map map) {
		if(map.get("view") == null)
			template.update("addCountPhoto", map);
		return template.selectOne("photoSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		map.put("today", new java.sql.Date(new java.util.Date().getTime()));
		return template.insert("photoInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("photoUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("photoDelete", map);
	}////////// delete

	@Override
	public List<Map> linkSelectList(Map map) {
		return template.selectList("linkSelectList", map);
	}////////// linkSelectList

	@Override
	public void linkInsert(Map map) {
		
		List list = (List) map.get("link_list");
		
		for(Object obj : list) {
			map.put("link_url", obj);
			template.insert("linkInsert", map);
		}
		
	}////////// linkInsert

	@Override
	public void linkUpdate(Map map) {
		
		List list = (List) map.get("link_list");
		
		for(Object obj:list) {
			map.put("link_url", obj);
		}
		
	}////////// linkUpdate

	@Override
	public void linkDelete(Map map) {
		template.delete("linkDelete", map);
	}////////// linkDelete

	@Override
	public int addHitCount(Map map) {
		return template.update("addHitCountPhoto", map);
	}////////// addHitCount

}//////////////////// PhotoBoardDAO
