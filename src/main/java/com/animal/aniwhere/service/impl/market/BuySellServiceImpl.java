package com.animal.aniwhere.service.impl.market;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.market.BuySellDTO;

@Service("buySellService")
public class BuySellServiceImpl implements AllBoardService {

	@Resource(name = "buySellDAO")
	private BuySellDAO dao;
	
	@Override
	public List<BuySellDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public BuySellDTO selectOne(Map map) {
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

}//////////////////// BuyServiceImpl class
