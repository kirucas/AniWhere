package com.animal.aniwhere.service.impl.animal;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.animal.MovieBoardDTO;

@Repository
public class MovieBoardDAO implements AllBoardService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<MovieBoardDTO> selectList(Map map) {
		/*
		로그인 처리 완료 전까지는 일단 주석 처리
		return template.selectList("movieSelectList", map);
		*/
		return null;
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("movieCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MovieBoardDTO selectOne(Map map) {
		return template.selectOne("movieSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		/*
		로그인 처리 완료 전까지는 일단 주석 처리
		return template.insert("movieInsert", map);
		*/
		return 0;
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("movieUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("movieDelete", map);
	}////////// delete

}//////////////////// MovieBoardDAO class
