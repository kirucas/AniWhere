package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.animal.MovieBoardDTO;

@Service("movieService")
public class MovieBoardServiceImpl implements AllBoardService {

	@Resource(name = "movieBoardDAO")
	private MovieBoardDAO dao;

	@Override
	public List<MovieBoardDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MovieBoardDTO selectOne(Map map) {
		return dao.selectOne(map);
	}////////// seletOne

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

}//////////////////// MovieBoardServiceImpl class
