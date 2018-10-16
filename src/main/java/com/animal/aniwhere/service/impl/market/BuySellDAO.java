package com.animal.aniwhere.service.impl.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.animal.aniwhere.service.AllBoardService;
import com.animal.aniwhere.service.market.BuySellDTO;

@Repository
public class BuySellDAO implements AllBoardService {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BuySellDAO() {
		try {
			//String dbURL="oracle.jdbc.OracleDriver://localhost:11080/BUYBOARD";
			
			String dbURL="jdbc:OracleDriver://localhost:11080/BUYBOARD";
			String dbID="SPRING";
			String dbPassword="SPRING";
			
		
			
			
		} catch (Exception e) {
			
			
			
		}
		
		
		
	}
	
	
	
	
	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Override
	public List<BuySellDTO> selectList(Map map) {
		return template.selectList("bsSelectList", map);
	}////////// selectList

	@Override
	public int getTotalRecord(Map map) {
		return template.selectOne("bsCount", map);
	}////////// getTotalRecord

	@SuppressWarnings("unchecked")
	@Override
	public BuySellDTO selectOne(Map map) {
		return template.selectOne("bsSelectOne", map);
	}////////// selectOne

	@Override
	public int insert(Map map) {
		return template.insert("bsInsert", map);
	}////////// insert

	@Override
	public int update(Map map) {
		return template.update("bsUpdate", map);
	}////////// update

	@Override
	public int delete(Map map) {
		return template.delete("bsDelete", map);
	}////////// delete

}//////////////////// BuyDAO class
