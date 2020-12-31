package com.example.controller; 

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.common.CommandMap;
import com.example.service.CommonService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RestController
public class HomeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	CommonService commonService = new CommonService();

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/main"); 
				
		List<Map<String, Object>> list = commonService.search(map);
		mv.addObject("list", list);
		return mv;
	}
	
	
	@RequestMapping(value ="login.do", method = RequestMethod.GET)
	public ModelAndView loginTest(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		log.debug("Request Parameter : " + map);		
		log.info("memberInfo에 set한 map : " + map);
				
		ModelAndView mv = new ModelAndView("/login");
				
		mv.addObject("map", map);
		return mv;
	}

	
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
	

//	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
//	public ModelAndView mypage(@RequestParam Map<String, Object> map) {
//		log.debug("Request Parameter : " + map);
//
//		ModelAndView mv = new ModelAndView("/mypage");
//
//		return mv;
//	}
	
	@RequestMapping(value = { "join.do" }, method = RequestMethod.GET)
	public ModelAndView join(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		
		
		ModelAndView mv = new ModelAndView("/join");
				

		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		ModelAndView mv = new ModelAndView("/search");
		
		List<Map<String, Object>> list = null;
		list = commonService.search(map);
		
		log.debug("search SQL result : "+list);
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value = { "product_ex" }, method = RequestMethod.GET)
	public ModelAndView product(@RequestParam Map<String, Object> map) {
		log.debug("Request Parameter : " + map);
		
		ModelAndView mv = new ModelAndView("/product");
				
		List<Map<String, Object>> list = commonService.search(map);
		mv.addObject("list", list);
		return mv;
	}
	
/*	@RequestMapping(value = "/sample/openSample.do", method = RequestMethod.GET)
	public ModelAndView test(@RequestParam Map<String, Object> map) {
		log.debug("map : " + map);

		ModelAndView mv = new ModelAndView("");
		return mv;
	}

	@RequestMapping(value = "/sample/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");
		if (!commandMap.isEmpty()) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	} */

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		HttpSession s = req.getSession();
		if(s.getAttribute("userInfo") != null)
			s.invalidate();
		return new ModelAndView("redirect:/");
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
			mv.addObject("msg", "success"); //성공 확인
			//죽엇나
			
		} else {
			mv.setViewName("/login");
			mv.addObject("msg", "failure"); //실패 확인
		}
		
		return mv;
	}
		@RequestMapping(value = "joinCheck.do", method = RequestMethod.POST) //매핑 요청 값, 방법 
	      public ModelAndView joinCheck(@RequestParam Map<String, Object> map, HttpServletRequest req) { //
	      log.debug("Request Parameter " + map); //콘솔 로그 출   
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
		

}