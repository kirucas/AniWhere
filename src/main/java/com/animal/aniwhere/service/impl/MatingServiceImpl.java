package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.MatingDTO;
import com.animal.aniwhere.service.member.AnimalDTO;

@Service("matingService")
public class MatingServiceImpl implements AllCommonService {

	@Resource(name = "matingDAO")
	private MatingDAO dao;

	@Override
	public List<MatingDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MatingDTO selectOne(Map map) {
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
	
	public List<AnimalDTO> selectMyMating(Map map){
		return dao.selectMyMating(map);
	}////////// selectMyMating

}//////////////////// MatingBoardServiceImpl class
