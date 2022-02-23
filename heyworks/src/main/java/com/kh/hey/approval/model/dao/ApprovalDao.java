package com.kh.hey.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;

@Repository
public class ApprovalDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String userName) {
		
		return sqlSession.selectOne("approvalMapper.selectListCount", userName);
		
	} // 결재자 기준 결재대기 게시글 갯수 조회
	
	public ArrayList<Approval> selectStandByList(SqlSessionTemplate sqlSession, PageInfo pi, String userName){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectStandByList", userName, rowBounds);
		
	} // 결재자 기준 결재대기 게시글 페이징처리와 함께 조회
	
	public int selectSubmitListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("approvalMapper.selectSubmitListCount", map);
		
	} // 기안자 기준 결재대기, 결재예정 게시글 갯수 조회
	
	public ArrayList<Approval> selectSubmitStandByList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSubmitStandByList", map, rowBounds);
		
	} // 기안자 기준 결재대기 게시글 페이징처리와 함께 조회
	
	public ArrayList<Approval> selectSubmitEndList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSubmitEndList", map, rowBounds);
		
	} // 결재자 기준 결재대기 게시글 페이징처리와 함께 조회

	public Approval selectApproval(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectApproval", ano);
		
	} // 모든 양식 게시글 양식종류~결재자까지 상세조회
	
	public Approval selectBusinessDraft(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectBusinessDraft", ano);
		
	} // 업무기안서 상세
	
	public Approval selectEquipmentBuy(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectEquipmentBuy", ano);
		
	}
	
	public Approval selectCertificate(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectCertificate", ano);
		
	}
	
	public Approval selectRecruiment(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectRecruiment", ano);
		
	}

	public Approval selectExpenseReport(SqlSessionTemplate sqlSession, String ano) {
	
		return sqlSession.selectOne("approvalMapper.selectExpenseReport", ano);
	
	}
	
	// 작성하기
	public int insertApproval(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertApproval", ap);
	
	}
	
	public int insertCertificate(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertCertificate", ap);
	
	}
	
	public int insertConfirm(SqlSessionTemplate sqlSession, ArrayList<Approval> confirmList) {
		
		int result = 0;
		
		if(confirmList.get(0).getConfirmNo() != null) { // 입력하기
			for(int i=0; i<confirmList.size(); i++) {
				result = sqlSession.insert("approvalMapper.insertConfirm", confirmList.get(i));
			}
		}else {
			for(int i=1; i<confirmList.size(); i++) {
				result = sqlSession.insert("approvalMapper.insertConfirm", confirmList.get(i));
			}
		}
		
		return result;
		
	}
	
	public int insertRecruimnet(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertRecruiment", ap);
		
	}
	
	public int insertExpenseReport(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertExpenseReport", ap);
		
	}
	
	public int insertBusinessDraft(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertBusinessDraft", ap);
		
	}
	
	public int insertEquipmentBuy(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertEquipmentBuy", ap);
		
	}
	
	public int insertItemList(SqlSessionTemplate sqlSession, ArrayList<Approval> itemList) {
		
		int result = 0;
		
		if(itemList.get(0).getItemName() != null) {
			for(int i=0; i<itemList.size(); i++) {
				result = sqlSession.insert("approvalMapper.insertItemList", itemList.get(i));
			}
		}else {
			for(int i=1; i<itemList.size(); i++) {
				result = sqlSession.insert("approvalMapper.insertItemList", itemList.get(i));
			}
		}
		
		return result;
		
	} // 비품 아이템들
	
	public int deleteApproval(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.update("approvalMapper.deleteApproval", ano);		
		
	}
	
	public int selectReadNrefListCount(SqlSessionTemplate sqlSession, String userNo) {
		
		return sqlSession.selectOne("approvalMapper.selectReadNrefListCount", userNo);
		
	}
	
	public ArrayList<Approval> selectReadReference(SqlSessionTemplate sqlSession, PageInfo rrpi, String userNo){
		
		int offset = (rrpi.getCurrentPage()-1) * rrpi.getBoardLimit();
		int limit = rrpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReadReference", userNo, rowBounds);
		
	}
	
	
	// 승인시 상태 변경하기(첫번째 결재자 기준)
	public int selectConfirmProcedure(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("approvalMapper.selectConfirmProcedure", map);
		
	}
	
	public int updateConfirmTable(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("approvalMapper.updateConfirmTable", map);
		
	}
	
	public int updateConfirmApproval(SqlSessionTemplate sqlSession, HashMap<String,String> map) {
	
		return sqlSession.update("approvalMapper.updateConfirmApproval", map);
	
	}

	// 마지막 결재자 승인시
	public int selectConfirmPeopleCount(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.selectOne("approvalMapper.selectConfirmPeopleCount", ano);
	
	}
	
	public int updateLastConfirm(SqlSessionTemplate sqlSession, String ano) {
		
		return sqlSession.update("approvalMapper.updateLastConfirm", ano);
	
	}
	
	public int updateConfirmReject(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("approvalMapper.updateConfirmReject", map);
		
	}
	
	public int selectDeleteListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("approvalMapper.selectDeleteListCount");
		
	}
	
	// 수정하기
	public int updateApproval(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateApproval", ap);
	}
	
	public int deleteConfirm(SqlSessionTemplate sqlSession, String ano) {
		return sqlSession.delete("approvalMapper.deleteConfirm", ano);
	}
	
	public int updateBusinessDraft(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateBusinessDraft", ap);
	}
	
	// 비품구매
	public int updateEquipmentBuy(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateEquipmentBuy", ap);
	}
	
	public int deleteItemList(SqlSessionTemplate sqlSession, String ano) {
		return sqlSession.delete("approvalMapper.deleteItemList", ano);
	}
	
	public int updateCertificate(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateCertificate", ap);
	}
	
	public int updateRecruiment(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateRecruiment", ap);
	}
	
	public int updateExpenseReport(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.update("approvalMapper.updateExpenseReport", ap);
	}
	
	
	
	
	
	
	// 관리자용 삭제된 문서 페이징+조회
	public ArrayList<Approval> selectDeleteList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeleteList", null, rowBounds);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
} // end ApprovalDao
