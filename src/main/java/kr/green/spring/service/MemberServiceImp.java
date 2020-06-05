package kr.green.spring.service;
 
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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
    
    @Override
	public List<Map<String, String>> getRoom(@Param("uid")int uid) {
		return memberDao.getRoom(uid);
	}
	
	@Override
	public void makeRoom(@Param("uid")int uid, @Param("title")String title, @Param("pw")String pw) {
		memberDao.makeRoom(uid, title, pw);
	}

	@Override
	public int countAllbyID(int id, String table_name) {
		return memberDao.countAllbyID(id, table_name);
	}
	
	@Override
	public int getNewRoomID(@Param("uid")int uid) {
		return memberDao.getNewRoomID(uid);
	}
	
	
}

