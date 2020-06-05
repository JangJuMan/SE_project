package kr.green.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

//import kr.green.spring.service.Map;

public interface MemberDAO {
	public String getEmailbyID(@Param("id")String id);
	
	public void insertNewUser(@Param("email")String email, @Param("name")String name);
	
	public void insertAdditionalNewUser(@Param("uid")int uid);
	
	public int getUidbyEmail(@Param("email")String email);
	
	public void insertSetting(@Param("uid")int uid, @Param("font")int font);
	
	public List<Map<String, String>> getRoom(@Param("uid")int uid);
	
	public void makeRoom(@Param("uid")int uid, @Param("title")String title, @Param("pw")String pw);
	
	public int countAllbyID(@Param("id")int id, @Param("table_name")String table_name);
	
	public int getNewRoomID(@Param("uid")int uid);
}
