package com.sssws03.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.sssws03.web.dao.AdminDAO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	public Map<String, Object> adminLogin(Map<String, Object> map) {
		return adminDAO.adminLogin(map);
	}

	public List<Map<String, Object>> list() {
		return adminDAO.list();
	}

	public void noticeWrite(Map<String, Object> map) {
		adminDAO.noticeWrite(map);
		
	}

	public String noticeDetail(int nno) {
		return adminDAO.noticeDetail(nno);
	}

	public int noticeHide(int nno) {
		return adminDAO.noticeHide(nno);
		
	}



	public List<Map<String, Object>> setupBoardList() {
		// TODO Auto-generated method stub
		return adminDAO.setupBoardList();
	}

}
