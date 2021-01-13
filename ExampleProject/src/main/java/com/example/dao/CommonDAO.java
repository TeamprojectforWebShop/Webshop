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
	
	//아이디 중복체크    
	public int idcheck(String id) { return (Integer) selectOne("common.idcheck", id);}
	
	//관리자 페이지 유저목록 보기
	public List<Map<String, Object>> userList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("common.userList", map);}  
	
	public int updateUser(Map<String, Object> map) { 
		return (Integer) update("common.updateUser", map);} 
	
	public int deleteUser(Map<String, Object> map){ 
		return (Integer) delete("common.deleteUser", map);} 
	
	//관리자 페이지 물품목록 보기
	public List<Map<String, Object>> productList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("common.productList", map);} 
	
	public int deleteProduct(Map<String, Object> map){ 
		return (Integer) delete("common.deleteProduct", map);} 
	
	//관리자 페이지 주문목록 보기
	public List<Map<String, Object>> orderList(Map<String, Object> map) { 
		return (List<Map<String, Object>>)selectList("common.orderList", map);} 
	
	public int updateOrder(Map<String, Object> map) { 
		return (Integer) update("common.updateOrder", map);} 
	
	public int deleteOrder(Map<String, Object> map){ 
		return (Integer) delete("common.deleteOrder", map);} 

//		게시판 다오
		//게시판
		public int boardwrite(Map<String, Object> map) {
			return (Integer) insert ("common.boardwrite", map);
		}
		
		//게시판 수정
		public int boardupdate(Map<String, Object> map) { 
		      return (Integer) update("common.boardupdate", map);
		}
		//게시판 삭제
		   public int boarddelete(String bno){ 
		      return (Integer) delete("common.boarddelete", bno);} 

			/*
			 * 게시판읽기
			 */
		   public Map<String, Object > boardread(Map<String, Object> map) { 
			      return (Map<String, Object >) selectOne ("common.boardread", map);}

		   		/*
				 * 게시판리스트부르기
				 */
		   public List<Map<String, Object >> boardlist(Map<String, Object> map) { 
			   return  (List<Map<String, Object >>) selectList ("common.boardlist", map);}
}
