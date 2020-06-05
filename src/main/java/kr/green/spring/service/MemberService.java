package kr.green.spring.service;

import java.util.List;

public interface MemberService {
	public String getEmailbyID(String id);
	
	public void insertNewUser(String email, String name);
	
	public void insertAdditionalNewUser(int uid);
	
	public int getUidbyEmail(String email);
	
	public void insertSetting(int uid, int font);

}
