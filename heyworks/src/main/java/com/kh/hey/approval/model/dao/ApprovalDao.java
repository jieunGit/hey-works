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
		
		for(int i=0; i<confirmList.size(); i++) {
		
			result = sqlSession.insert("approvalMapper.insertConfirm", confirmList.get(i));
			
		}
		
		return result;
		
	}
	
	public int insertRecruimnet(SqlSessionTemplate sqlSession, Approval ap) {
		
		return sqlSession.insert("approvalMapper.insertRecruiment", ap);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // end ApprovalDao
