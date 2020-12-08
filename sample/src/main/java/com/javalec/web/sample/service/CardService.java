package com.javalec.web.sample.service;


import java.util.HashMap;
import java.util.List;

import com.javalec.web.sample.model.CardVO;


public interface CardService {
	public List<CardVO> getCard() throws Exception;
	public int insertSet(CardVO cardVO) throws Exception;
	public List<CardVO> selectSet(String uid) throws Exception;
	public void createNewTable(CardVO cardVO) throws Exception;
	public List<CardVO> showCard(HashMap<String, Object>map) throws Exception;
	public List<CardVO> showCard2(HashMap<String, Object>map) throws Exception;
	public List<CardVO> showCardImportant(HashMap<String, Object>map) throws Exception;
	public int insertCard(CardVO cardVO) throws Exception;
	public int getCardCnt(HashMap<String, Object> map) throws Exception;
	public int getImportantCardCnt(HashMap<String, Object> map) throws Exception;
	public int updateImportant(CardVO cardVO) throws Exception;
	public int updateCard(CardVO cardVO) throws Exception;
	public int deleteCard(CardVO cardVO) throws Exception;
	public List<CardVO> visitSetList(String uid) throws Exception;
	public int bookMark(CardVO cardVO) throws Exception;
}
