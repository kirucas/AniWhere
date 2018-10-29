package com.animal.aniwhere.service.impl.market;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllCommonService;
import com.animal.aniwhere.service.market.GroupBuyDTO;

@Service("groupBuyService")
public class GroupBuyServiceImpl implements AllCommonService {

	@Resource(name = "groupBuyDAO")
	private GroupBuyDAO dao;
	
	@Override
	public List<GroupBuyDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public GroupBuyDTO selectOne(Map map) {
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
	
	public int getTotalSell(Map map) {
		return dao.getTotalSell(map);
	}////////// getTotalSell

}//////////////////// GroupBuyServiceImpl class
