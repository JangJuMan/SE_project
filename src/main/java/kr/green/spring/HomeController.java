package kr.green.spring;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.dto.DateData;
import kr.green.spring.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value= {"/main/home","/home.do"})
	public ModelAndView openTilesView(ModelAndView mv, Model model, HttpServletRequest request, 
			DateData dateData, HttpSession session) throws Exception{
		mv.setViewName("/main/home");//타일즈 view => 일반 view
		
		if((Boolean) session.getAttribute("session_validity")) {
			// 로그인 시 이메일 계정이 없다면 생성한다.
			String email = (String)session.getAttribute("email");
			String name = (String)session.getAttribute("user_name");
			System.out.println("email: "+email+"\nname: "+name);
			memberService.insertNewUser(email, name);
			
			// 최초 회원가입시 설정 폰트를 14pt로 설정한다.
			int uid = memberService.getUidbyEmail(email);
			session.setAttribute("uid", uid);
			System.out.println("setting > uid : " + uid);
			memberService.insertAdditionalNewUser(uid);
			
			// room 조회하기 
			mv.addObject("RoomList", memberService.getRoom(uid));
			
			System.out.println("before cnt");
			
			// room 개수 세기
			int cnt = memberService.countAllbyID(uid, "room") - 1;
			System.out.println("cnt : "+cnt);
			mv.addObject("room_count", cnt);
			
			System.out.println("after cnt");
		}
		
		// 달력 : 달력쓰고 싶은 페이지에서 이렇게 선언 한다음,
		// main/home.jsp 에서 jsp-include한 것처럼 사용하면 됨.
		calendarView(mv, model, request, dateData);
		return mv;
	}
	
	@RequestMapping(value = "/main/makeRoom", method = { RequestMethod.GET, RequestMethod.POST })
	public String makeRoom(HttpSession session, Model model, @RequestParam("title")String title)throws IOException {
		if((Boolean) session.getAttribute("session_validity")) {
			System.out.println("여기는 makeRoom");
			Integer uid = (Integer) session.getAttribute("uid");
			System.out.println(">> uid >> : "+uid+"\ntitle : "+title);
			
			// CREATE NEW ROOM
			memberService.makeRoom(uid, title, "password");
			
			// get new room id
			int room_id = memberService.getNewRoomID(uid);
			String msg = "새로운 방 (room ID : "+room_id+")이 생성되었습니다.";
			String url = "../room/"+room_id+"/main";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			System.out.println("return alert");
			return "alert";
		}
		model.addAttribute("msg", "세션이 만료되어 설정 변경에 실패하였습니다.");
		model.addAttribute("url", "../login");
		System.out.println("return alert");
		return "alert";
		
	}
	
	
	@RequestMapping(value= {"/main/setting","/setting.do"})
	public ModelAndView settingView(ModelAndView mv, HttpSession session) throws Exception{
		 
		mv.setViewName("/main/setting");//타일즈 view => 일반 view
		return mv;
	}
	
	@RequestMapping(value = "/main/settingAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String settingAction(HttpSession session, Model model, @RequestParam("font")int font)throws IOException {
		if((Boolean) session.getAttribute("session_validity")) {
			System.out.println("font : " + font);
			System.out.println("여기는 settingAction");
			Integer uid = (Integer) session.getAttribute("uid");
			System.out.println(">> uid >> : "+uid);
			memberService.insertSetting(uid, font);			
			model.addAttribute("msg", "설정이 변경되었습니다.");
			model.addAttribute("url", "home");
			System.out.println("return alert");
			return "alert";
		}
		model.addAttribute("msg", "세션이 만료되어 설정 변경에 실패하였습니다.");
		model.addAttribute("url", "../login");
		System.out.println("return alert");
		return "alert";
	}
	
	
	@RequestMapping(value= {"/main/private","/private.do"})
	public ModelAndView privateView(ModelAndView mv) throws Exception{
		mv.setViewName("/main/private");//타일즈 view => 일반 view : 이부분 지우면 일반 레이아웃 나옴.
		return mv;
	}
	
	@RequestMapping(value= {"/main/calendar","/calendar.do"})
	public ModelAndView calendarView(ModelAndView mv, Model model, HttpServletRequest request, DateData dateData) throws Exception{
		System.out.println("calendar.do ACtion");
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return mv;
	}
	
}
