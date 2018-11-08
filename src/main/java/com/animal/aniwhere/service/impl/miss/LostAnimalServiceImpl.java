package com.animal.aniwhere.service.impl.miss;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.miss.LostAnimalDTO;

@Service("lostAniService")
public class LostAnimalServiceImpl implements AllCommonService {

	@Resource(name="lostAnimalDAO")
	private LostAnimalDAO dao;
	
	@Override
	public List<LostAnimalDTO> selectList(Map map) {
		return dao.selectList(map);
	}//////////

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}//////////

	@SuppressWarnings("unchecked")
	@Override
	public LostAnimalDTO selectOne(Map map) {
		return dao.selectOne(map);
	}//////////

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}//////////

	@Override
	public int update(Map map) {
		return dao.update(map);
	}//////////

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}//////////
	
	public int passDateOnNotice() {
		return dao.passDateOnNotice();
	}////////// passDateOnNotice

}//////////////////// LostAnimalServiceImpl
