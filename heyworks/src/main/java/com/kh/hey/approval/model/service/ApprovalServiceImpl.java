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

	// 작성하기
	@Override
	public int insertApproval(Approval ap) {
		
		return aDao.insertApproval(sqlSession, ap);
		
	} // 공통부분

	@Override
	public int insertCertificate(Approval ap) {
		
		return aDao.insertCertificate(sqlSession, ap);
		
	}

	@Override
	public int insertConfirm(ArrayList<Approval> confirmList) {
		
		return aDao.insertConfirm(sqlSession, confirmList);
		
	}

	@Override
	public int insertRecruiment(Approval ap) {
		
		return aDao.insertRecruimnet(sqlSession, ap);
		
	}

	@Override
	public int insertExpenseReport(Approval ap) {
		
		return aDao.insertExpenseReport(sqlSession, ap);
		
	}

	@Override
	public int insertBusinessDraft(Approval ap) {
		
		return aDao.insertBusinessDraft(sqlSession, ap);
		
	}

	@Override
	public int insertEquipmentBuy(Approval ap) {
		return aDao.insertEquipmentBuy(sqlSession, ap);
	}

	@Override
	public int insertItemList(ArrayList<Approval> itemList) {
		return aDao.insertItemList(sqlSession, itemList);
	} // 작성하기 끝
	
	// 삭제하기(기안취소)
	@Override
	public int deleteApproval(String ano) {
		
		return aDao.deleteApproval(sqlSession, ano);
		
	}

	// 결재 열람참조자 목록(열람참조자 기준)
	@Override
	public int selectReadNrefListCount(String userNo) {
		return aDao.selectReadNrefListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> selectReadReference(PageInfo rrpi, String userNo) {
		return aDao.selectReadReference(sqlSession, rrpi, userNo);
	}
	
	// 승인하기
	@Override
	public int selectConfirmProcedure(HashMap<String, String> map) {
		return aDao.selectConfirmProcedure(sqlSession, map);
	}

	@Override
	public int updateConfirmTable(HashMap<String, String> map) {
		return aDao.updateConfirmTable(sqlSession, map);
	}
	
	@Override
	public int updateConfirmApproval(HashMap<String,String> map) {
		return aDao.updateConfirmApproval(sqlSession, map);
	}

	@Override
	public int selectConfirmPeopleCount(String ano) {
		return aDao.selectConfirmPeopleCount(sqlSession, ano);
	}

	@Override
	public int updateLastConfirm(String ano) {
		return aDao.updateLastConfirm(sqlSession, ano);
	}

	// 반려하기
	@Override
	public int updateConfirmReject(HashMap<String, String> map) {
		return aDao.updateConfirmReject(sqlSession, map);
	}

	@Override
	public int selectDeleteListCount() {
		return aDao.selectDeleteListCount(sqlSession);
	}

	@Override
	public ArrayList<Approval> selectDeleteList(PageInfo pi) {
		return aDao.selectDeleteList(sqlSession, pi);
	}
	
	// 수정하기-----------------------------------------------------

	@Override
	public int updateApproval(Approval ap) {
		return aDao.updateApproval(sqlSession, ap);
	}

	@Override
	public int deleteConfirm(String ano) {
		return aDao.deleteConfirm(sqlSession, ano);
	}

	@Override
	public int updateBusinessDraft(Approval ap) {
		return aDao.updateBusinessDraft(sqlSession, ap);
	}

	@Override
	public int updateEquipmentBuy(Approval ap) {
		return aDao.updateEquipmentBuy(sqlSession, ap);
	}

	@Override
	public int deleteItemList(String ano) {
		return aDao.deleteItemList(sqlSession, ano);
	}

	@Override
	public int updateCertificate(Approval ap) {
		return aDao.updateCertificate(sqlSession, ap);
	}

	@Override
	public int updateRecruiment(Approval ap) {
		return aDao.updateRecruiment(sqlSession, ap);
	}

	@Override
	public int updateExpenseReport(Approval ap) {
		return aDao.updateExpenseReport(sqlSession, ap);
	}

	

	
}
