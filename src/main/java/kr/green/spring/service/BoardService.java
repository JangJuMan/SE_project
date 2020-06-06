package kr.green.spring.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardService {
	public List<Map<String, String>> getBoard(int room_id);
	public List<Map<String, String>> getBoardSpecific(int board_id);
	public List<Map<String, String>> getComment(int board_id);
	public void deleteBoard(int board_id);
	public void addBoard(int room_id, String uid, String title, String content, String date);
	public void addComment(int board_id, String uid, String content, String date);
}
