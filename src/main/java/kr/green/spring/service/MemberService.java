package kr.green.spring.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
	public String getEmailbyID(String id);
	
	public void insertNewUser(String email, String name);
	
	public void insertAdditionalNewUser(int uid);
	
	public int getUidbyEmail(String email);
	
	public void insertSetting(int uid, int font);
	
	public List<Map<String, String>> getRoom(@Param("uid")int uid);
	
	public void makeRoom(@Param("uid")int uid, @Param("title")String title, @Param("pw")String pw);
	
	public int countAllbyID(@Param("id")int id, @Param("table_name")String table_name);
	
	public int getNewRoomID(@Param("uid")int uid);
}
