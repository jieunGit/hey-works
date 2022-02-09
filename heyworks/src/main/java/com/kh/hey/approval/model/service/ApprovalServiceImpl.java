package com.kh.hey.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.approval.model.vo.Approval;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Approval> selectList(PageInfo pi) {
		return null;
	}

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
	public Approval selectElectronic(String elecApprovalNo) {
		return null;
	}

	@Override
	public int updateReadReferenceStatus(String read, String reference) {
		return 0;
	}

	@Override
	public int updateElectronic(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateBusinessDraft(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateEquipmentBuy(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateItemList(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateCertificate(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateRecruiment(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int updateExpenseReport(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteElectronic(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteBusinessDraft(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteEquipmentBuy(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteItemList(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteCertificate(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteRecruiment(String elecApprovalNo) {
		return 0;
	}

	@Override
	public int deleteExpenseReport(String elecApprovalNo) {
		return 0;
	}

	
}
