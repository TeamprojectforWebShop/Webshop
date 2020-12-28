package com.example.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
//기록저장소 
@Repository("commonDAO") 
@SuppressWarnings("unchecked")
public class CommonDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	
	//unchecked : 검증되지 않은 연산자 관련 경고 억제
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("common.search", map);} 
	//common.getList의 common은 common_sql의 mapper namespace="common"
	
	public Map<String, Object> loginCheck(Map<String, Object> map) { //회원 로그인 체크
		return (Map<String, Object>)selectOne("common.loginCheck", map);} 

	public int joinCheck(Map<String, Object> map) {
		return (Integer) insert("common.joinCheck", map);} 
	
	
}
