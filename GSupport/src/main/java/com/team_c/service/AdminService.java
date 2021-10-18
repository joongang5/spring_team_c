package com.team_c.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface AdminService {
	
	List<Map<String, Object>> shopList();
	
	//관리자 login
	Map<String, Object> access(Map<String, Object> map);
	
	//관리자 logList 출력
	List<Map<String, Object>> logList(Map<String, Object> map);
	
	//totalCount
	public int totalCount(Map<String, Object> map);
	
	//adminLog페이지 ipList 불러오기
	public List<Object> ipList(); 

	//adminLog페이지 targetList 불러오기
	public List<Object> targetList(); 
	
	//adminLog 페이지 삭제
	public void deleteLog(String number); 
	
	public Map<String, Object> dashList(); 
	
}
