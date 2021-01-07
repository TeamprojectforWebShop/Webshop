package com.example.service;

import java.util.*;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.example.dao.CommonDAO;
// 실질적으로 사용자의 요청을 수행하는 곳 *한 번 더 검색해볼것. 김혜지 안정확함.
@Service("commonService")
public class CommonService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	public List<Map<String, Object >> search(Map<String, Object> map){ 
		  
		return commonDAO.search(map);
	}

	public Map<String, Object > loginCheck(Map<String, Object> map)
	{ 
		return commonDAO.loginCheck(map);} //회원 로그인 체크
	
	public int joinCheck(Map<String, Object> map)
	{ 
		return commonDAO.joinCheck(map);}

	//회원 정보 수정
	public int updateMember(Map<String, Object> map){ return commonDAO.updateMember(map);}
	
	//아이디 중복체크
	public int idcheck(String id) 
	{
	      return commonDAO.idcheck(id);}
	
	//게시판
	public int boardwrite(Map<String, Object>map) 
	{ 
		  return commonDAO.boardwrite(map);   }
	
	//관리자 유저목록 페이지
	public List<Map<String, Object>> userList(Map<String, Object> map) 
	{ 
		return commonDAO.userList(map);} 
	
	public Map<String, Object> updateUser(Map<String, Object> map)
	{ 
		return commonDAO.updateUser(map);} 
	
	public Map<String, Object> deleteUser(Map<String, Object> map)
	{ 
		return commonDAO.deleteUser(map);} 
	
	//관리자 물품목록
	public List<Map<String, Object>> productList(Map<String, Object> map) 
	{ 
		return commonDAO.productList(map);} 
	
	//관리자 주문목록
	public List<Map<String, Object>> orderList(Map<String, Object> map) 
	{ 
		return commonDAO.orderList(map);} 
	/*
	 * 제품 상세보기
	 */
	public List<Map<String, Object >> detailPage(Map<String, Object> map) {
		 return commonDAO.detailPage(map); 
	 }

	/*
	 * 결제페이지
	 */
	 public List<Map<String, Object>> cart(Map<String, Object>map) { 
		 return	commonDAO.cart(map);
	 }
	 
	 /*
	 구매페이지
	 */
	 public List<Map<String, Object>> pay(Map<String, Object>map) { 
		 return	commonDAO.pay(map);
	 }
	 
	 /*
		 * 메인에 제품 내용 뿌리기
		 */
		public List<Map<String, Object >> getList(Map<String, Object> map){ 
			return commonDAO.getList(map);
		}
}