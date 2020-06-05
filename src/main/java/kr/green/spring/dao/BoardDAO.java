package kr.green.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardDAO {
	public List<Map<String, String>> getBoard(@Param("room_id")int room_id);
	public void deleteBoard(@Param("board_id")int board_id);
	public void addBoard(@Param("room_id")int room_id, @Param("uid")String uid, @Param("title")String title, @Param("content")String content, @Param("date")String date);
}
