package com.sssws03.web.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
	
  public Map<String, Object> login(Map<String, String> map);

public Map<String, Object> myInfo(String id);
}
