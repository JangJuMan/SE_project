package kr.green.spring.service;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	public List<Map<String, String>> getSchedule(int room_id);
	public void deleteSchedule(int task_id);
	public void addSchedule(int room_id, String startDate, String endDate, String title);
}
