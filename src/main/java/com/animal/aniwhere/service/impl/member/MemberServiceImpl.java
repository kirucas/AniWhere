package com.animal.aniwhere.service.impl.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.animal.aniwhere.service.member.AllMemberService;
import com.animal.aniwhere.service.member.MemberDTO;

@Service("memberService")
public class MemberServiceImpl implements AllMemberService {

	@Resource(name = "memberDAO")
	private MemberDAO dao;
	
	@Override
	public List<MemberDTO> selectList(Map map) {
		return dao.selectList(map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return dao.getTotalRecord(map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public MemberDTO selectOne(Map map) {
		return dao.selectOne(map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}//////////insert

	@Override
	public int update(Map map) {
		return dao.update(map);
	}////////// update

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}////////// delete

	@Override
	public boolean isMember(Map map) {
		return dao.isMember(map);
	}////////// isMember
	
	public int changePassword(Map map) {
		return dao.changePassword(map);
	}////////// changePassword

}//////////////////// MemberServiceImpl class
