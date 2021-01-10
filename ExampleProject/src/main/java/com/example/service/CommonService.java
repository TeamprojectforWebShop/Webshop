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
	public int idcheck(String id) {
	      return commonDAO.idcheck(id);
	}
	
	//관리자 유저목록 페이지
	public List<Map<String, Object>> userList(Map<String, Object> map) 
	{ 
		return commonDAO.userList(map);} 
	
	public int updateUser(Map<String, Object> map)
	{ 
		return commonDAO.updateUser(map);} 
	
	public int deleteUser(Map<String, Object> map)
	{ 
		return commonDAO.deleteUser(map);} 
	
	//관리자 물품목록
	public List<Map<String, Object>> productList(Map<String, Object> map) 
	{ 
		return commonDAO.productList(map);} 
	
	public int deleteProduct(Map<String, Object> map)
	{ 
		return commonDAO.deleteProduct(map);} 
	
	//관리자 주문목록
	public List<Map<String, Object>> orderList(Map<String, Object> map) 
	{ 
		return commonDAO.orderList(map);} 
	
	public int updateOrder(Map<String, Object> map)
	{ 
		return commonDAO.updateOrder(map);} 
	
	public int deleteOrder(Map<String, Object> map)
	{ 
		return commonDAO.deleteOrder(map);} 
	
	
//	여기서부는 제품페이지
	/*
	 * 제품 상세보기
	 */
	public List<Map<String, Object >> detailPage(Map<String, Object> map) {
		 return commonDAO.detailPage(map); 
	 }

	 /*
		 * 메인에 제품 내용 뿌리기
		 */
		public List<Map<String, Object >> getList(Map<String, Object> map){ 
			return commonDAO.getList(map);
		}
		
		/*
		 * 장바구니에 하나 넣기
		 */
		public List<Map<String, Object >> addcart(Map<String, Object> map){ 
			return commonDAO.addcart(map);
		}
		
		//구매페이지
		public List<Map<String, Object >> checkcart(Map<String, Object> map){ 
			return commonDAO.checkcart(map);
		}
		
		//결제페이지
		public List<Map<String, Object >> order(Map<String, Object> map){ 
			return commonDAO.order(map);
		}
		
		/*
		 * 장바구니 페이지
		 */ 
		public List<Map<String, Object >> resultcart(Map<String, Object> map){ 
			return commonDAO.resultcart(map);
		}

		/*
		 * 장바구니삭제
		 */
		public int deletecart(Map<String, Object> map){ 
			return commonDAO.deletecart(map);
		}

		
//		여기서부터 게시판
		/*
		 * 게시판 수정
		 */
		public int boardupdate(Map<String, Object> map){
			return commonDAO.boardupdate(map);
		}

		/*
		 * 게시판 삭제
		 */
		public int boarddelete(String bno){
			return commonDAO.boarddelete(bno);
		}

		/*
		 * 게시판목록
		 */
		public List<Map<String, Object>> boardlist(Map<String, Object> map) {
			return  commonDAO.boardlist(map);
		} //이거 상태 이상함
		
		/*
		 * 게시판글쓰기
		 */
		public Map<String, Object> boardread(Map<String, Object>map) {
			return commonDAO.boardread(map);
		}
		
		//글쓰기 기능
		public int boardwrite(Map<String, Object>map){
			return commonDAO.boardwrite(map);
		}
}