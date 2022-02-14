package com.kh.hey.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.approval.model.dao.ApprovalDao;
import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private ApprovalDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(String userName) {
		
		return aDao.selectListCount(sqlSession, userName);
		
	} // 결재자 기준 결재대기 갯수조회

	@Override
	public ArrayList<Approval> selectStandByList(PageInfo pi, String userName) {
		
		return aDao.selectStandByList(sqlSession, pi, userName);
		
	} // 페이징바 처리한 결재자 기준 결재대기 게시글 조회

	@Override
	public int selectSubmitListCount(HashMap<String, String> map) {

		return aDao.selectSubmitListCount(sqlSession, map);
		
	} // 기안자 기준 상태값 따른 게시글 갯수조회
	
	@Override
	public ArrayList<Approval> selectSubmitStandByList(PageInfo pi, HashMap<String, String> map) {
		
		return aDao.selectSubmitStandByList(sqlSession, pi, map);

	} // 페이징바 처리한 기안자 기준 상태값 따른 게시글 조회(전체,대기,진행)
	
	@Override
	public ArrayList<Approval> selectSubmitEndList(PageInfo pi, HashMap<String, String> map) {
	
		return aDao.selectSubmitEndList(sqlSession, pi, map);
		
	} // 페이징바 처리한 기안자 기준 상태값 따른 게시글 조회(승인,반려,임시저장)
	
	@Override
	public Approval selectApproval(String ano) {
		
		return aDao.selectApproval(sqlSession, ano);
		
	} // 모든 양식 게시글 양식종류~결재자까지 상세조회

	@Override
	public Approval selectBusinessDraft(String ano) {
		
		return aDao.selectBusinessDraft(sqlSession, ano);
		
	} // 업무기안서 상세

	@Override
	public Approval selectEquipmentBuy(String ano) {
		
		return aDao.selectEquipmentBuy(sqlSession, ano);
		
	}

	@Override
	public Approval selectCertificate(String ano) {
		
		return aDao.selectCertificate(sqlSession, ano);
		
	}

	@Override
	public Approval selectRecruiment(String ano) {
		
		return aDao.selectRecruiment(sqlSession, ano);
		
	}

	@Override
	public Approval selectExpenseReport(String ano) {
		
		return aDao.selectExpenseReport(sqlSession, ano);
		
	}
	
	

	
}
