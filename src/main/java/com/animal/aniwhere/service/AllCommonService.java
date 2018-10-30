package com.animal.aniwhere.service;

import java.util.List;
import java.util.Map;

public interface AllCommonService {

	// list
	List<?> selectList(Map map);

	// All Record count
	int getTotalRecord(Map map);

	// view
	<T> T selectOne(Map map);

	// insert/update/delete
	int insert(Map map);

	int update(Map map);

	int delete(Map map);

}//////////////////// AllBoardService interface
