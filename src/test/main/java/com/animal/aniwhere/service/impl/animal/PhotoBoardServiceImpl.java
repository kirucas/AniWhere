package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.animal.PhotoBoardDTO;
import com.animal.aniwhere.service.animal.PhotoService;

@Service("photoService")
public class PhotoBoardServiceImpl implements PhotoService {

	@Resource(name = "photoBoardDAO")
	private PhotoBoardDAO dao;
	
	@Override
	public List<PhotoBoardDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public PhotoBoardDTO selectOne(Map map) {
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
	public List<Map> linkSelectList(Map map) {
		return dao.linkSelectList(map);
	}////////// linkSelectList

	@Override
	public void linkInsert(Map map) {
		dao.linkInsert(map);
	}////////// linkInsert

	@Override
	public void linkUpdate(Map map) {
		dao.linkUpdate(map);
	}////////// linkUpdate

	@Override
	public void linkDelete(Map map) {
		dao.linkDelete(map);
	}////////// linkDelete

}//////////////////// PhotoBoardServiceImpl class
