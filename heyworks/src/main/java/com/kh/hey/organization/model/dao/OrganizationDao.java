package com.kh.hey.organization.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.organization.model.vo.Organ;

@Repository
public class OrganizationDao {
	
	public ArrayList<Organ> selectOrgan(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectOne("organMapper.selectOrgan");
	}

}
