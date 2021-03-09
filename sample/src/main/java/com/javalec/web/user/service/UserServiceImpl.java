package com.javalec.web.user.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.javalec.web.user.controller.UserController;
import com.javalec.web.user.dao.UserDAO;
import com.javalec.web.user.model.UserVO;

@Service
public class UserServiceImpl implements UserService{

	private static final Logger logger = 
			LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO userDAO;
	
	@Override
	public List<UserVO> getUserInfo(String uid) throws Exception {
		return userDAO.getUserInfo(uid);
	}

	@Override
	public UserVO getLogin(UserVO userVO) throws Exception {
		return userDAO.getLogin(userVO);
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return userDAO.insertUser(userVO);
		
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		return userDAO.updateUser(userVO);
		
	}

	@Override
	public List<UserVO> getMember() throws Exception {
		return userDAO.getMember();
	}


}
