package kr.green.spring.service;
 
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import kr.green.spring.dao.MemberDAO;
 
@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;
    
    @Override
    public String getEmailbyID(String id) {
        return memberDao.getEmailbyID(id);
    }
    
    @Override
    public void insertNewUser(String email, String name) {
    	memberDao.insertNewUser(email, name);
    }
    
    @Override
    public void insertAdditionalNewUser(int uid) {
    	memberDao.insertAdditionalNewUser(uid);
    }
    
    @Override
    public int getUidbyEmail(String email) {
    	return memberDao.getUidbyEmail(email);
    }
    
    @Override
    public void insertSetting(int uid, int font) {
    	memberDao.insertSetting(uid, font);
    }
}

