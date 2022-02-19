package com.kh.hey.working.model.service;

import java.util.ArrayList;

import com.kh.hey.working.model.vo.Leave;

public interface WorkingService {

	// 출근시간 insert
	int insertClockIn(int userNo);
	
	// 퇴근시간 update
	int updateClockOut(int userNo);
	
	// 휴가신청 insert
	int insertLeave(Leave l);
	
	// 휴가신청내역 select
	ArrayList<Leave> selectMyleave(int userNo);
}
