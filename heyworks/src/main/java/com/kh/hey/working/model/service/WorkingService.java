package com.kh.hey.working.model.service;

public interface WorkingService {

	// 출근시간 insert
	int insertClockIn(int userNo);
	
	// 퇴근시간 insert
	int updateClockOut(int userNo);
}
