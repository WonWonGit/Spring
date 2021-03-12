package com.javalec.web.sample.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.web.sample.model.CardVO;
import com.javalec.web.sample.tool.Pagination;
import com.javalec.web.user.model.UserVO;

@Repository
public class CardDAOImpl implements CardDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CardVO> getCard() throws Exception {
		
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.getCard");
	}

	@Override
	public List<CardVO> getCardUser(String user) throws Exception {
		
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.getCardUser",user);
	}

	@Override
	public int insertCard(CardVO cardVO) throws Exception {
		int result=0;
		try {
			result=sqlSession.insert("com.javalec.web.sample.cardMapper.insertCard",cardVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateCard(CardVO cardVO) throws Exception {
		int result = 0;
		try {
			result= sqlSession.insert("com.javalec.web.sample.cardMapper.updateCard",cardVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteCard(CardVO cardVO) throws Exception {
		int result = 0;
		try {
			result = sqlSession.delete(
					"com.javalec.web.sample.cardMapper.deleteCard", cardVO);
		}catch(Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}

	@Override
	public int insertSet(CardVO cardVO) throws Exception {
		int result = 0;
		try {
			result= sqlSession.insert("com.javalec.web.sample.cardMapper.insertSet",cardVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CardVO> selectSet(String uid) throws Exception {
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.selectSet",uid);
	}

	@Override
	public int deletSet(String list_name) throws Exception {
		int result=0;
		try {
			result=sqlSession.delete("com.javalec.web.sample.cardMapper.deletSet",list_name);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int createNewTable(CardVO cardVO) throws Exception {
		return sqlSession.update("com.javalec.web.sample.cardMapper.createNewTable",cardVO);
	}

	@Override
	public List<CardVO> showCard(HashMap<String, Object>map) throws Exception {
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.showCard", map);
	}

	@Override
	public int getCardCnt(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.javalec.web.sample.cardMapper.getCardCnt", map);
	}
	
	@Override
	public int getImportantCardCnt(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.javalec.web.sample.cardMapper.getImportantCardCnt", map);
	}

	@Override
	public List<CardVO> showCard2(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.showCard2", map);
	}

	@Override
	public int updateImportant(CardVO cardVO) throws Exception {
		int result = 0;
		try {
			result= sqlSession.insert("com.javalec.web.sample.cardMapper.updateImportant",cardVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CardVO> showCardImportant(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.showCardImportant", map);
	}

	@Override
	public List<CardVO> visitSetList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.visitSetList",uid);
	}

	@Override
	public int bookMark(CardVO cardVO) throws Exception {
		int result=0;
		try {
			result=sqlSession.insert("com.javalec.web.sample.cardMapper.bookMark",cardVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CardVO> bookMarkList(String uid) throws Exception {
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.bookMarkList",uid);
	}

	@Override
	public int deleteBookMark(int no) throws Exception {
		int result=0;
		try {
			result=sqlSession.delete("com.javalec.web.sample.cardMapper.deleteBookMark",no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CardVO> myBookMark(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.javalec.web.sample.cardMapper.myBookMark",uid);
	}

	


	
	

}
