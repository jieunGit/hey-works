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

	} // 페이징바 처리한 기안자 기준 상태값 따른 게시글 조회
	
	
	
	
	@Override
	public int insertElectronic(Approval a) {
		return 0;
	}

	@Override
	public int insertBusinessDraft(Approval a) {
		return 0;
	}

	@Override
	public int insertEquipmentBuy(Approval a) {
		return 0;
	}

	@Override
	public int insertItemList(Approval a) {
		return 0;
	}

	@Override
	public int insertCertificate(Approval a) {
		return 0;
	}

	@Override
	public int insertRecruiment(Approval a) {
		return 0;
	}

	@Override
	public int insertExpenseReport(Approval a) {
		return 0;
	}

	@Override
	public Approval selectElectronic(String approvalNo) {
		return null;
	}

	@Override
	public int updateReadReferenceStatus(String read, String reference) {
		return 0;
	}

	@Override
	public int updateElectronic(String approvalNo) {
		return 0;
	}

	@Override
	public int updateBusinessDraft(String approvalNo) {
		return 0;
	}

	@Override
	public int updateEquipmentBuy(String approvalNo) {
		return 0;
	}

	@Override
	public int updateItemList(String approvalNo) {
		return 0;
	}

	@Override
	public int updateCertificate(String approvalNo) {
		return 0;
	}

	@Override
	public int updateRecruiment(String approvalNo) {
		return 0;
	}

	@Override
	public int updateExpenseReport(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteElectronic(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteBusinessDraft(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteEquipmentBuy(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteItemList(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteCertificate(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteRecruiment(String approvalNo) {
		return 0;
	}

	@Override
	public int deleteExpenseReport(String approvalNo) {
		return 0;
	}


	
}
