package kr.green.spring;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.dto.DateData;
import kr.green.spring.service.CommentService;
import kr.green.spring.service.BoardService;
import kr.green.spring.service.ScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {
	
	@Autowired
	ScheduleService ScheduleService;
	
	@Autowired
	BoardService BoardService;
	
	@RequestMapping(value= {"/room/{roomNum}/main"})
	public ModelAndView roomMainView(ModelAndView mv, Model model, HttpServletRequest request, DateData dateData, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/main");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		calendarMiniView(mv, model, request, dateData);
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/calendar"})
	public ModelAndView roomCalendarView(ModelAndView mv, Model model, HttpServletRequest request, DateData dateData, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/schedule/roomCalendar");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		calendarView(mv, model, request, dateData);
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/schedule"})
	public ModelAndView roomScheduleView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/schedule/schedule");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		mv.addObject("schedule", ScheduleService.getSchedule(roomNum));
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/scheduleAdd"})
	public ModelAndView roomScheduleAddView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/schedule/add");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		return mv;
	}
	
	@RequestMapping(value= "/room/{roomNum}/scheduleAddAction", method = RequestMethod.GET)
	public ModelAndView roomScheduleAddAction(ModelAndView mv, @PathVariable("roomNum") int roomNum, String startDate, String endDate, String title) throws Exception{
		ScheduleService.addSchedule(roomNum, startDate, endDate, title);
		mv.setViewName("redirect:/room/" + roomNum + "/schedule");//타일즈 view => 일반 view
		return mv;
	}
	
	@RequestMapping(value= "/room/{roomNum}/scheduleDelete", method = RequestMethod.GET)
	public ModelAndView roomScheduleDelete(ModelAndView mv, @PathVariable("roomNum") int roomNum, int task_id) throws Exception{
		ScheduleService.deleteSchedule(task_id);
		mv.setViewName("redirect:/room/" + roomNum + "/schedule");//타일즈 view => 일반 view
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/notice"})
	public ModelAndView roomNoticeView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/notice/notice");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		mv.addObject("board", BoardService.getBoard(roomNum));
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/noticeAdd"})
	public ModelAndView roomNoticeAddView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/notice/add");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		return mv;
	}
	
	@RequestMapping(value= "/room/{roomNum}/noticeAddAction", method = RequestMethod.GET)
	public ModelAndView roomNoticeAddAction(ModelAndView mv, @PathVariable("roomNum") int roomNum, String title, String content, String date) throws Exception{
		BoardService.addBoard(roomNum, "21500602", title, content, date);
		mv.setViewName("redirect:/room/" + roomNum + "/notice");//타일즈 view => 일반 view
		return mv;
	}
	
	@RequestMapping(value= "/room/{roomNum}/noticeDelete", method = RequestMethod.GET)
	public ModelAndView roomNoticeDelete(ModelAndView mv, @PathVariable("roomNum") int roomNum, int board_id) throws Exception{
		BoardService.deleteBoard(board_id);
		mv.setViewName("redirect:/room/" + roomNum + "/notice");//타일즈 view => 일반 view
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/invite"})
	public ModelAndView roomInviteView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/management/invite");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/authorityManagement"})
	public ModelAndView roomAuthorityManagementView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/management/authorityManagement");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		return mv;
	}
	
	@RequestMapping(value= {"/room/{roomNum}/setting"})
	public ModelAndView roomSettingView(ModelAndView mv, @PathVariable("roomNum") int roomNum) throws Exception{
		mv.setViewName("/room/setting");//타일즈 view => 일반 view
		mv.addObject("roomNum", roomNum);
		return mv;
	}
	
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
	
	public ModelAndView calendarMiniView(ModelAndView mv, Model model, HttpServletRequest request, DateData dateData) throws Exception{
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
		
		//날짜 삽입
		for (int i = today_info.get("today"); i < today_info.get("today") + 7; i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i%today_info.get("endDay")), "normal_date");
			}
			dateList.add(calendarData);
		}

		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return mv;
	}
}
