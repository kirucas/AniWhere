package com.animal.aniwhere.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.AllCommentDTO;
import com.animal.aniwhere.service.AllCommentService;

@Service("allCommentService")
public class AllCommentServiceImpl implements AllCommentService {

	@Resource(name = "allCommentDAO")
	private AllCommentDAO dao;

	@Override
	public List<AllCommentDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public void insert(Map map) {
		dao.insert(map);
	}////////// insert

	@Override
	public void update(Map map) {
		dao.update(map);
	}////////// update

	@Override
	public void delete(Map map) {
		dao.delete(map);
	}////////// delete

	@Override
	public int commentCount(Map map) {
		return dao.commentCount(map);
	}////////// commentCount

	@Override
	public int addHitCountComment(Map map) {
		return dao.addHitCountComment(map);
	}////////// addHitCountComment

}//////////////////// AllCommentServiceImpl class
