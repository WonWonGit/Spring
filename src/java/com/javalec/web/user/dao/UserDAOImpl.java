package com.javalec.web.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javalec.web.user.model.UserVO;
import com.javalec.web.user.service.UserService;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public List<UserVO> getUserInfo(String uid) throws Exception {
		return sqlSession.selectList("com.javalec.web.user.userMapper.getUserInfo",uid);
	}

	@Override
	public UserVO getLogin(UserVO userVO) throws Exception {
		UserVO result = null;
		
		try {
			result = sqlSession.selectOne("com.javalec.web.user.userMapper.getLogin",userVO);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	@Override
	public int insertUser(UserVO userVO) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert(
					"com.javalec.web.user.userMapper.insertUser", userVO);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
		
	}

	@Override
	public int updateUser(UserVO userVO) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update(
					"com.javalec.web.user.userMapper.updateUser", userVO);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	@Override
	public List<UserVO> getMember() throws Exception {
		return sqlSession.selectList("com.javalec.web.user.userMapper.getMember");
	}



}
