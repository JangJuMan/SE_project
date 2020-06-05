package kr.green.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ScheduleDAO {
	public List<Map<String, String>> getSchedule(@Param("room_id")int room_id);
	public void deleteSchedule(@Param("task_id")int task_id);
	public void addSchedule(@Param("room_id")int room_id, @Param("startDate")String startDate, @Param("endDate")String endDate, @Param("title")String title);
}
