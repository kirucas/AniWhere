package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllBoardService;

@Service("draftingService")
public class DraftingServiceImpl implements AllBoardService {

	@Resource(name = "draftingDAO")
	private DraftingDAO dao;

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map selectOne(Map map) {
		return dao.selectOne(map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}////////// insert

	@Override
	public int update(Map map) {
		return dao.update(map);
	}////////// update

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}////////// delete

	@Override
	public int addHitCount(Map map) {
		return dao.addHitCount(map);
	}////////// addHitCount

}//////////////////// DraftingServiceImpl class
