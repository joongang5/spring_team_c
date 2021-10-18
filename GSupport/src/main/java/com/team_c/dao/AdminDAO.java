package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO extends AbstractDAO{

	public Map<String,Object> access(Map<String, Object> map){
		return selectOne("admin.access", map);
	}

	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return selectList("admin.logList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.totalCount", map).get("totalCount")));
	}

	public List<Object> ipList() {
		return selectOptionList("admin.ipList");
	}

	public List<Object> targetList() {
		return selectOptionList("admin.targetList");
	}

	public void deleteLog(String number) {
		deleteLog("admin.deleteLog", number);
	}

	public Map<String, Object> dashList() {
		return selectOne("admin.dashList");
	}
	
}
