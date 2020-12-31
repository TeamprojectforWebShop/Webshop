package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
//기록저장소 
@Repository("commonDAO") 
@SuppressWarnings("unchecked")
public class CommonDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	
	/******** SELECT ********/
	//unchecked : 검증되지 않은 연산자 관련 경고 억제
	public List<Map<String, Object>> search(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("common.search", map);} 
	//common.getList의 common은 common_sql의 mapper namespace="common"
	
	 //회원 로그인 체크
	public Map<String, Object> loginCheck(Map<String, Object> map) { return (Map<String, Object>)selectOne("common.loginCheck", map);} 

	/******** INSERT ********/
	public int joinCheck(Map<String, Object> map) { return (Integer) insert("common.joinCheck", map);} 
	
	/******** UPDATE ********/
	public int updateMember(Map<String, Object> map) { return (Integer) update("common.updateMember", map);} 
	
	/*
	 * 상품 자세히 보기
	 */
	public List<Map<String, Object>> detailPage(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("common.detailPage", map);
	}
	
	/*
	 * 장바구니
	 */
	 public List<Map<String, Object>> cart(Map<String, Object> map) {
		 return (List<Map<String, Object>>)insert("common.cart", map);
	}

	/*
	 * 구매페이지
	 */
	public List<Map<String, Object>> pay(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("common.pay", map);
	}
	
	/*
	 * 상품테이블 호출
	 */
	public List<Map<String, Object>> getList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("common.getList", map);
	} 
	
}
