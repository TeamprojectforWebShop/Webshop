package com.example.service;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.CommonDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("commonService")
public class CommonService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
	public List<Map<String, Object >> getList(Map<String, Object> map)
	{ 
		return commonDAO.getList(map);}

	public Map<String, Object > loginCheck(Map<String, Object> map)
	{ 
		return commonDAO.loginCheck(map);} //회원 로그인 체크
	
	/*public Map<String, Object > logout(Map<String, Object> map)
	{ 
		return commonDAO.logout(map);} //회원 로그아웃*/

	public int joinCheck(Map<String, Object> map)
	{ 
		return commonDAO.joinCheck(map);}

	public void logout(HttpSession session) {
		session.invalidate();
	}
}