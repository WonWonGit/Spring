package com.javalec.web.user.dao;

import java.util.List;

import com.javalec.web.user.model.UserVO;

public interface UserDAO {
	public UserVO getUserInfo(String uid) throws Exception;
	public UserVO getLogin(UserVO userVO) throws Exception;
	public List<UserVO> getMember() throws Exception;
	public int insertUser(UserVO userVO) throws Exception;
	public int updateUser(UserVO userVO) throws Exception;
	
}
