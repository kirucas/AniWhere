package com.animal.aniwhere.service.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.member.AllMemberService;
import com.animal.aniwhere.service.member.MemberDTO;

@Repository
public class MemberDAO implements AllMemberService {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	@Override
	public List<MemberDTO> selectList(Map map) {
		return template.selectList("memberSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("memberCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MemberDTO selectOne(Map map) {
		return template.selectOne("memberSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("memberInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("memberUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("memberDelete", map);
	}////////// delete

	@Override
	public boolean isMember(Map map) {
		return (Integer) template.selectOne("memberCheck", map) == 1 ? true : false;
	}////////// isMemeber
	
}//////////////////// MemberDAO class
