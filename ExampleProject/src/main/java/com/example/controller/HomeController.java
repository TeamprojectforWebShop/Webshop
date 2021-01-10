package com.example.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.CommonService;

@Controller
@RestController
public class HomeController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "commonService")
	CommonService commonService = new CommonService();

	
	/*
	 * 메인페이지
	 */

	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/main");
				
		List<Map<String, Object>> list = commonService.getList(null);
		mv.addObject("list", list);
		mv.addObject("map", map);
		
		System.out.println("list출력" + list);
		System.out.println("map출력" + map);
		
		return mv;
	}
	
	@RequestMapping(value ="login.do", method = RequestMethod.GET)
	public ModelAndView loginTest(@RequestParam Map<String, Object> map, HttpServletRequest req) {
	
		log.debug("Request Parameter : " + map);				
		
		ModelAndView mv = new ModelAndView("/login");
		
		mv.addObject("map", map);
		
		return mv;
	}
	
	@ResponseBody
	   @RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
	   public JSONObject idcheck(@RequestBody String id) {

	      log.info("id check Parameter : " + id);
	      
	      JSONObject jobj = new JSONObject();
	      jobj.put("cnt", 0);

	      int cnt = commonService.idcheck(id);
	      if (cnt > 0) {
	         jobj.put("cnt", cnt);
	      }

	      return jobj;
	   }

//관리자페이지시작
	@RequestMapping(value = "manage.do", method = RequestMethod.GET)
	public ModelAndView manage(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/manage");

		return mv;
	}
	
	@RequestMapping(value = "userList.do", method = RequestMethod.GET)
	public ModelAndView userList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/userList");
		
		List<Map<String, Object>> list = commonService.userList(map);
		          
		log.debug("search SQL result : " + list);
		mv.addObject("list", list);
		
		return mv;
	}

	
	@RequestMapping(value="/modUserList.do", method=RequestMethod.POST)
	public ModelAndView modUserList(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("/userList");
		
		log.info("modUserList map : "+ map);
		
		int rs = commonService.updateUser(map);
		
		log.info("modUserList rs : " + rs);
		mv.addObject("rs", rs);
		
	    List<Map<String, Object>> list = commonService.userList(null);
		mv.addObject("list", list);
		
		return mv;
	}
	  
	  @RequestMapping(value = "/listDelete.do", method = RequestMethod.GET)
	   public ModelAndView listDelete(@RequestParam Map<String, Object> map,  HttpServletRequest req ) {
		  log.info("listDelete.do RequestParam : " + map);
	      ModelAndView mv = new ModelAndView("/userList");
	      
	    int rs = commonService.deleteUser(map);
	    mv.addObject("rs", rs);

	    List<Map<String, Object>> list = commonService.userList(null);
		mv.addObject("list", list);

	    return mv;
	   }
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/productList");
		
		List<Map<String, Object>> list = commonService.productList(map);
		          
		log.debug("search SQL result : " + list);
		mv.addObject("list", list);
		
		return mv;
	}
	

	
	  @RequestMapping(value = "prodListDelete.do", method = RequestMethod.GET)
	   public ModelAndView prodListDelete(@RequestParam Map<String, Object> map,  HttpServletRequest req ) {
		  log.info("prodListDelete.do RequestParam : " + map);
	      ModelAndView mv = new ModelAndView("/productList");
	      
	    int rs = commonService.deleteProduct(map);
	    mv.addObject("rs", rs);

	    List<Map<String, Object>> list = commonService.productList(null);
		mv.addObject("list", list);

	    return mv;
	   }
	
	@RequestMapping(value = "orderList.do", method = RequestMethod.GET)
	public ModelAndView orderList(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/orderList");
		
		List<Map<String, Object>> list = commonService.orderList(map);
		          
		log.debug("search SQL result : " + list);
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/modOrderList.do", method=RequestMethod.POST)
	public ModelAndView modOrderList(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("/orderList");
		
		log.info("modOrderList map : "+ map);
		
		int rs = commonService.updateOrder(map);
		
		log.info("modOrderList rs : " + rs);
		mv.addObject("rs", rs);
		
	    List<Map<String, Object>> list = commonService.orderList(null);
		mv.addObject("list", list);
		
		return mv;
	}
	  
	
	  @RequestMapping(value = "orderListDelete.do", method = RequestMethod.GET)
	   public ModelAndView orderListDelete(@RequestParam Map<String, Object> map,  HttpServletRequest req ) {
		  log.info("orderListDelete.do RequestParam : " + map);
	      ModelAndView mv = new ModelAndView("/orderList");
	      
	    int rs = commonService.deleteOrder(map);
	    mv.addObject("rs", rs);

	    List<Map<String, Object>> list = commonService.orderList(null);
		mv.addObject("list", list);

	    return mv;
	   }
//여기까지 관리자
	  
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(@RequestParam Map<String, Object> map) throws Exception {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/mypage");
		
		return mv;
	}
	
	/* JSONObject Key => code
	 * value 의미
	 * 200 : Success
	 * 400 : Error */

	@ResponseBody
	@RequestMapping(value="/modMember.do", method=RequestMethod.POST)
	public JSONObject modMember(@RequestParam Map<String, Object> map, HttpServletRequest req) {
	
		log.info("수정하는 회원이 보낸 정보 Parameter : " + map);
		
		JSONObject jobj = new JSONObject();
		jobj.put("code", 400);
		
		int rs = commonService.updateMember(map);
		
		if(rs > 0) {
			jobj.put("code", 200);
			req.getSession().setAttribute("userInfo", map);
		}
		
		return jobj;
	}
	
	@RequestMapping(value = { "join.do" }, method = RequestMethod.GET)
	public ModelAndView join(@RequestParam Map<String, Object> map) {

		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/join");
		
		return mv;
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, Object> map) {
	
		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/search");

		List<Map<String, Object>> list = null;
		list = commonService.search(map);

		log.debug("search SQL result : " + list);

		mv.addObject("list", list);

		return mv;
	}

	/*
	 * 제품 상세페이지 String product_code는 where절에 넣기 위해서 생성
	 */
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public ModelAndView product(@RequestParam Map<String, Object> map,
			@RequestParam("product_code") String product_code) {
		log.debug("Request Parameter : " + map);

		ModelAndView mv = new ModelAndView("/detail");

		System.out.println("test" + product_code);

		List<Map<String, Object>> get = commonService.detailPage(map);
		mv.addObject("get", get);
		mv.addObject("map", map);

		System.out.println("list출력" + get);
		System.out.println("map출력" + map);

		return mv;
	}
	
	/*
	 * 장바구니에 바로 추가 후 페이지 전환 용
	 */
	@RequestMapping(value = "addcart.do", method = RequestMethod.GET)
	public ModelAndView addcart(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("redirect:/resultcart.do");

		List<Map<String, Object>> addcart = commonService.addcart(map);
		System.out.println("addcart출력" + addcart);
		mv.addObject("addcart", addcart);
		return mv;
	}
	
	/*
	 * 장바구니 삭제기능
	 */
	@RequestMapping(value = "delcart.do", method = RequestMethod.GET)
	public ModelAndView delcart(@RequestParam Map<String, Object> map, HttpSession session) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("redirect:/resultcart.do");

		Map info = (Map) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") != null) {
			map.put("table", "shop_db.customer_cart");
		} else {
			map.put("table", "shop_db.noncustomer_cartt");
		}
		int cart = commonService.deletecart(map);

		mv.addObject("cart", cart);
		System.out.println("cart출력 : " + cart);
		return mv;
	}
	
	/*
	 * 장바구니페이지
	 */
	@RequestMapping(value = "resultcart.do", method = RequestMethod.GET)
	public ModelAndView cartlist(@RequestParam Map<String, Object> map, HttpSession session) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/resultcart");

		Map info = (Map) session.getAttribute("userInfo");

		if (session.getAttribute("userInfo") != null) {
			map.put("table", "shop_db.customer_cart");
			map.put("id", info.get("id"));
		} else {
			map.put("table", "shop_db.noncustomer_cart");
			map.put("id", session.getId());
		}

		List<Map<String, Object>> list = commonService.resultcart(map);
		mv.addObject("list", list);
		mv.addObject("map", map);

		System.out.println("resultcart출력" + list);
		System.out.println("map출력" + map);

		return mv;
	}
	
	/*
	 * 결제페이지
	 */
	@RequestMapping(value = "order.do", method = RequestMethod.POST)
	public ModelAndView order(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/order");
		List<String> box = Arrays.asList(req.getParameterValues("box"));
		log.debug(box);
		map.put("box", box);
		List<Map<String, Object>> list = commonService.checkcart(map);
		mv.addObject("list", list);
		
		System.out.println(list);

		return mv;
	}
	
	/*
	 * 결과페이지 미완성
	 */
	@RequestMapping(value = "bill.do", method = RequestMethod.POST)
	public ModelAndView bill(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/bill");

		List<Map<String, Object>> list = commonService.order(map);
		mv.addObject("list", list);

		System.out.println(list);

		return mv;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		
		HttpSession s = req.getSession();
		
		ModelAndView mv = new ModelAndView("redirect:/");
		
		if (s.getAttribute("userInfo") != null)
			mv.addObject("msg", "사이트에서 안전하게 로그아웃 되었습니다.");
			s.invalidate();
			
		return mv;
	}
	
	//여기에 받아오는 MAP은 사용자가 JSP에서 입력한 값을 받아오는 MAP key value
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST) //매핑 요청 값, 방법 
	public ModelAndView loginCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) { 
		
		log.debug("Request Parameter : " + map); //콘솔 로그 출력
		
		ModelAndView mv = new ModelAndView("redirect:/"); //괄호 안의 값을 보여주는것, 이동하는것이 x 
		
		Map<String, Object> userInfo = commonService.loginCheck(map); 
		
		if(userInfo != null) { //널 체크
			HttpSession s = req.getSession(); //세션 생성
			s.setAttribute("userInfo", userInfo); //세션에 속성값 부여
			s.setMaxInactiveInterval(30*60); //세션 시간
			mv.addObject("msg", "로그인 성공"); //성공 확인
		} else {
			mv.addObject("msg", "아이디 및 비밀번호를 다시 확인해주세요."); // 실패 확인
			mv.setViewName("/login");
			
		}
		
		return mv;
	}

		@RequestMapping(value = "joinCheck.do", method = RequestMethod.POST) //매핑 요청 값, 방법 
	      public ModelAndView joinCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) { //
	     
		  log.debug("Request Parameter " + map); //콘솔 로그 출력   
	      
	      ModelAndView mv = new ModelAndView("redirect:/"); //괄호 안의 값을 보여주는것, 이동하는것이 x 
	         int rs = commonService.joinCheck(map); 
	      
	         if(rs > 0) { //널 체크
	            HttpSession s = req.getSession(); //세션 생성 
	            s.setAttribute("userInfo", map); //세션에 속성값 부여 
	            mv.addObject("msg", "회원가입 성공");
	            
	         } else {
	            mv.setViewName("redirect:/join.do");
	            mv.addObject("msg", "회원가입 실패");
	         }
	         
	      return mv;
	}

	/*
	 * 게시판
	 */
			// 게시판 글 작성
			   @RequestMapping(value = "boardwrite.do", method = RequestMethod.GET)
			   public ModelAndView boardwrite(@RequestParam Map<String, Object> map) {
			      ModelAndView mv = new ModelAndView("/boardwrite");
			       
			      return mv;
			   }
			   
			   @ResponseBody
			   @RequestMapping(value = "/boardWriteAjax.do", method = RequestMethod.POST)
			   public JSONObject boardWriteAjax(@RequestParam Map<String, Object> map, HttpServletRequest req) {

			      log.debug("Request Parameter " + map); // 콘솔 로그 출력
			      
			      JSONObject jobj = new JSONObject();
			      jobj.put("code", 400);

			      int cnt = commonService.boardwrite(map);
			      
			      log.info("cnt : " + cnt);
			      if (cnt > 0) {
			         jobj.put("code", 200);
			      }
//			      req.getSession().setAttribute("userInfo", map);
			      return jobj;
			   }
			   
			   //게시판 삭제
			   @ResponseBody
			   @RequestMapping(value="/boarddelete.do", method=RequestMethod.POST)
			   public JSONObject boarddelete(@RequestBody String bno, @RequestParam Map<String, Object> map, HttpServletRequest req) {
			   
			      log.info("삭제 bno Parameter : " + bno);
			      
			      JSONObject jobj = new JSONObject();
			      jobj.put("code", 400);
			      
			      int rs = commonService.boarddelete(bno);
			      if(rs > 0) {
			         jobj.put("code", 200);
			         req.getSession().setAttribute("userInfo", map);
			      }
			      
			      return jobj;
			   }
			   @ResponseBody
			   @RequestMapping(value="/boardupdate.do", method=RequestMethod.POST)
			   public JSONObject boardupdate(@RequestParam Map<String, Object> map, HttpServletRequest req) {
			   
			      log.info("수정 : " + map);
			      
			      JSONObject jobj = new JSONObject();
			      jobj.put("code", 400);
			      
			      int rs = commonService.boardupdate(map);
			      if(rs > 0) jobj.put("code", 200);
			      
			      
			      return jobj;
			   }
			   
			   @RequestMapping(value = "boardread.do", method = RequestMethod.GET)
			   public ModelAndView boardread(@RequestParam Map<String, Object> map)  {

			      log.debug("Request Parameter : " + map);
			      
			      ModelAndView mv = new ModelAndView("/boardread");
			      Map<String, Object > boardread = commonService.boardread(map);
			      
			      log.info("boardread 결과 : " + boardread);
			        
			      mv.addObject("boardread", boardread);
			      return mv;
			   }

			   @RequestMapping(value = "board.do", method = RequestMethod.GET)
			   public ModelAndView board(@RequestParam Map<String, Object> map) {
				   
				   log.debug("Request Parameter : " + map);
				   
				   ModelAndView mv = new ModelAndView("/board");
				   
				   return mv;
			   }
			   @RequestMapping(value = "boardlist.do", method = RequestMethod.GET)
			   public ModelAndView boardlist(@RequestParam Map<String, Object> map)  {
				   
				   log.debug("Request Parameter : " + map);
				   
				   ModelAndView mv = new ModelAndView("/boardlist");
				   List<Map<String, Object>> list = commonService.boardlist(map);
				   
				   log.debug("search SQL result : " + list);
				   mv.addObject("list", list);
				   return mv;
			   }
				/*
				 * 게시판끝
				 */
}