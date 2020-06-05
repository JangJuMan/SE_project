package kr.green.spring.service;
 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import kr.green.spring.dao.BoardDAO;
 
@Service
public class BoardServiceImp implements BoardService {
    @Autowired
    BoardDAO BoardDao;
    
    @Override
    public List<Map<String, String>> getBoard(int room_id) {
        return BoardDao.getBoard(room_id);
    }
    
    @Override
    public void deleteBoard(int board_id) {
    	BoardDao.deleteBoard(board_id);
        return;
    }
    
    @Override
    public void addBoard(int room_id, String uid, String title, String content, String date) {
    	BoardDao.addBoard(room_id, uid, title, content, date);
        return;
    }
}

