package kr.green.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberDAO {
	public String getEmailbyID(@Param("id")String id);
	
	public void insertNewUser(@Param("email")String email, @Param("name")String name);
	
	public void insertAdditionalNewUser(@Param("uid")int uid);
	
	public int getUidbyEmail(@Param("email")String email);
	
	public void insertSetting(@Param("uid")int uid, @Param("font")int font);
}
