package kr.green.spring.dao;

import org.apache.ibatis.annotations.Param;

public interface CommentDAO {
	public String getEmail(@Param("id")String id);
}
