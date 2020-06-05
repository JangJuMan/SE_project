package kr.green.spring.service;
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import kr.green.spring.dao.ScheduleDAO;
 
@Service
public class ScheduleServiceImp implements ScheduleService {
    @Autowired
    ScheduleDAO ScheduleDao;
    
    @Override
    public List<Map<String, String>> getSchedule(int room_id) {
        return ScheduleDao.getSchedule(room_id);
    }
    
    @Override
    public void deleteSchedule(int task_id) {
    	ScheduleDao.deleteSchedule(task_id);
        return;
    }
    
    @Override
    public void addSchedule(int room_id, String startDate, String endDate, String title) {
    	ScheduleDao.addSchedule(room_id, startDate, endDate, title);
        return;
    }
}

