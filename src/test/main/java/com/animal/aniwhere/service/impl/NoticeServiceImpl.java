package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.NoticeDTO;

@Service("noticeService")
public class NoticeServiceImpl implements AllBoardService {

	@Resource(name = "noticeDAO")
	private NoticeDAO dao;

	@Override
	public List<NoticeDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public NoticeDTO selectOne(Map map) {
		return dao.selectOne(map);
	}////////// seleteOne

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

}//////////////////// NoticeServieImpl class
