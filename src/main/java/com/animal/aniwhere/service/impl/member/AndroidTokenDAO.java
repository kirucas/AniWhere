package com.animal.aniwhere.service.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllCommonService;

@Repository("tokenDAO")
public class AndroidTokenDAO implements AllCommonService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<Map> selectList(Map map) {
		return template.selectList("tokenSelectList", map);
	}

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("tokenCount", map);
	}

	@Override
	public Map selectOne(Map map) {
		return template.selectOne("tokenSelectOne", map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("tokenInsert", map);
	}

	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return template.delete("tokenDelete", map);
	}

}
