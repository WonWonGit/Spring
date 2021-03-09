package com.javalec.web.sample.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.web.sample.dao.CardDAO;
import com.javalec.web.sample.model.CardVO;

@Service
public class CardServiceImpl implements CardService{
	
	@Inject
	private CardDAO cardDAO;

	@Override
	public List<CardVO> getCard() throws Exception {

		return cardDAO.getCard();
	}

	@Override
	public int insertSet(CardVO cardVO) throws Exception {
		
		return cardDAO.insertSet(cardVO);
	}

	@Override
	public List<CardVO> selectSet(String uid) throws Exception {
		return cardDAO.selectSet(uid);
	}

	@Override
	public void createNewTable(CardVO cardVO) throws Exception {
		cardDAO.createNewTable(cardVO);
		
	}

	@Override
	public List<CardVO> showCard(HashMap<String, Object> map) throws Exception {
		return cardDAO.showCard(map);
	}
	
	@Override
	public List<CardVO> showCard2(HashMap<String, Object> map) throws Exception {
		return cardDAO.showCard2(map);
	}

	@Override
	public int insertCard(CardVO cardVO) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.insertCard(cardVO);
	}

	@Override
	public int getCardCnt(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.getCardCnt(map);
	}
	@Override
	public int getImportantCardCnt(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.getImportantCardCnt(map);
	}
	@Override
	public int updateImportant(CardVO cardVO) throws Exception {
		return cardDAO.updateImportant(cardVO);
		
	}

	@Override
	public List<CardVO> showCardImportant(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.showCardImportant(map);
	}

	@Override
	public int updateCard(CardVO cardVO) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.updateCard(cardVO);
	}

	@Override
	public int deleteCard(CardVO cardVO) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.deleteCard(cardVO);
	}

	@Override
	public List<CardVO> visitSetList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.visitSetList(uid);
	}

	@Override
	public int bookMark(CardVO cardVO) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.bookMark(cardVO);
	}

	@Override
	public List<CardVO> bookMarkList(String uid) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.bookMarkList(uid);
	}

	@Override
	public int deleteBookMark(int no) throws Exception {
		// TODO Auto-generated method stub
		return cardDAO.deleteBookMark(no);
	}

	

}
