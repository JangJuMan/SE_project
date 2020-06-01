package kr.green.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/")
	public ModelAndView main(ModelAndView mv) throws Exception{
		mv.setViewName("/main/home");
		mv.addObject("setHeader", "타일즈테스트: value : /");
//		mv.setViewName("/main/login");
//		mv.addObject("setHeader", "Site Login");
//		System.out.println(memberService.getEmail("test_id_1"));
		return mv;
	}
	
	@RequestMapping(value= {"/main/home","/home.do"})
	public ModelAndView openTilesView(ModelAndView mv, HttpSession session) throws Exception{
		mv.setViewName("/main/home");//타일즈 view => 일반 view
//		mv.addObject("setHeader", "타일즈테스트: value : /main/home");
		System.out.println("GO MAIN >>> " + session.getAttribute("user_name"));
		return mv;
	}
	
	@RequestMapping(value= {"/main/setting","/setting.do"})
	public ModelAndView settingView(ModelAndView mv) throws Exception{
		mv.setViewName("/main/setting");//타일즈 view => 일반 view
//		mv.addObject("setHeader", "타일즈테스트: value : /main/home");
		return mv;
	}
	
	@RequestMapping(value= {"/main/private","/private.do"})
	public ModelAndView privateView(ModelAndView mv) throws Exception{
		mv.setViewName("/main/private");//타일즈 view => 일반 view
//		mv.addObject("setHeader", "타일즈테스트: value : /main/home");
		return mv;
	}
}
