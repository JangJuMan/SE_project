package kr.green.spring.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import kr.green.spring.dao.CommentDAO;
 
@Service
public class CommentServiceImp implements CommentService {
    @Autowired
    CommentDAO CommentDao;
    
    @Override
    public String getEmail(String id) {
        return CommentDao.getEmail(id);
    }
}

