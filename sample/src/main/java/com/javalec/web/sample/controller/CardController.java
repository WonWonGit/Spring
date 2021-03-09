package com.javalec.web.sample.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.web.sample.model.CardVO;
import com.javalec.web.sample.service.CardService;
import com.javalec.web.sample.tool.Pagination;
import com.javalec.web.user.model.UserVO;




@Controller
@RequestMapping(value="/card")
public class CardController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CardController.class);
	
	@Inject
	private CardService cardService;
	
	
	@RequestMapping(value="/insertSet", method=RequestMethod.POST)
	public String insertSet(@ModelAttribute("cardVO") CardVO cardVO, Model model,HttpServletResponse response) throws Exception{
		int result = cardService.insertSet(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도 해 주세요.');</script>"); 
			out.flush();
		}
		return "redirect:/card/create?uid="+cardVO.uid;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String selectSet(Model model,@RequestParam("uid") String uid) throws Exception{
		model.addAttribute("cardVO", new CardVO());
		model.addAttribute("selectSet", cardService.selectSet(uid));
		System.out.println("uid="+uid);
		return "card/create";
	}
	
	@RequestMapping(value="/createNewTable", method=RequestMethod.POST)
	public String createNewTable(@ModelAttribute("cardVO") CardVO cardVO, HttpServletResponse response) throws Exception{
		cardService.createNewTable(cardVO);
		
		return "redirect:/card/create?uid="+cardVO.uid;
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="/showCard", method=RequestMethod.GET)
	public String showCard(Model model, HashMap<String, Object> map, HttpSession session
						  , @RequestParam("list_name") String list_name
						  , @RequestParam("uid") String uid
						  , @RequestParam(required = false, defaultValue = "1") int page
						  , @RequestParam(required = false, defaultValue = "1") int range
						  , @RequestParam(required = false, defaultValue = "1") int ipage
						  , @RequestParam(required = false, defaultValue = "1") int irange) throws Exception{
		Pagination pagination = new Pagination();
		Pagination importantPagination = new Pagination();
		model.addAttribute("cardVO", new CardVO());
		map.put("uid", uid);
		map.put("list_name", list_name);
		int CardCnt =cardService.getCardCnt(map);
		int importantCard = cardService.getImportantCardCnt(map);
		model.addAttribute("cnt",CardCnt);
		model.addAttribute("impCnt",importantCard);
		pagination.pageInfo(page, range, CardCnt);
		importantPagination.pageInfo(ipage, irange, importantCard);
		map.put("startList", pagination.getStartList());
		map.put("listSize", pagination.getListSize());
		map.put("impStartList", importantPagination.getStartList());
		map.put("impListSize", importantPagination.getListSize());
		model.addAttribute("pagination",pagination);
		model.addAttribute("importantPagination",importantPagination);
		//카드뒤집기 데이터의 경우 리밋 없이 한꺼번에 다 출력
		model.addAttribute("cardList",cardService.showCard2(map));
		//테이블로 출력시 페이징처리 위해서 리밋설정
		model.addAttribute("tableList",cardService.showCard(map));
		model.addAttribute("importantList",cardService.showCardImportant(map));
		
		return"card/showCard";
	}
	
	
	@RequestMapping(value="/insertCard", method=RequestMethod.GET)
	public String insertCard(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpServletResponse response, HttpSession session) throws Exception {
		int result = cardService.insertCard(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
		}
		System.out.println(cardVO.uid+cardVO.list_name);
		return "redirect:/card/showCard?list_name="+cardVO.list_name;
	}
	
	@RequestMapping(value="/updateImportant", method=RequestMethod.GET)
	public String updateImportant(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpServletResponse response) throws Exception {
		int result = cardService.updateImportant(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
		}
		System.out.println(cardVO.uid+cardVO.list_name+cardVO.card_num);
		return "redirect:/card/showCard?list_name="+cardVO.list_name;
	}
	
	@RequestMapping(value="/updateCard", method=RequestMethod.GET)
	public String updateCard(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpServletResponse response) throws Exception {
		int result = cardService.updateCard(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
			
		}
		System.out.println(cardVO.uid+cardVO.list_name+cardVO.card_num);
		return "redirect:/card/showCard?list_name="+cardVO.list_name;
	}
	
	@RequestMapping(value="/deleteCard", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteCard(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpServletResponse response) throws Exception {
		int result = cardService.deleteCard(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
		}
		System.out.println(cardVO.card_num);
		return "redirect:/card/showCard?list_name="+cardVO.list_name;
	}
	
	@RequestMapping(value = "/visit", method = RequestMethod.GET)
	public String visitSetList(Model model,@RequestParam("uid") String uid) throws Exception{
		model.addAttribute("cardVO", new CardVO());
		model.addAttribute("visitSet", cardService.visitSetList(uid));
		return "card/visit";
	}
	@RequestMapping(value = "/visitCard", method = RequestMethod.GET)
	public String visitCard(Model model
							,@RequestParam("uid") String uid
							,@RequestParam("list_name") String list_name
							,HashMap<String, Object> map) throws Exception{
		model.addAttribute("cardVO", new CardVO());
		map.put("list_name", list_name);
		map.put("uid", uid);
		model.addAttribute("visitCard", cardService.showCard2(map));
		System.out.println(uid+list_name);
		return "card/visitCard";
	}
	
	@RequestMapping(value = "/bookMark", method = RequestMethod.GET)
	public String bookmark(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpServletResponse response) throws Exception {
		int result = cardService.bookMark(cardVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
		}
		System.out.println(cardVO.uid+cardVO.list_name);
		return "redirect:/card/card";
	}
	
	@RequestMapping(value = "/bookMarkList", method = RequestMethod.GET)
	public String visitSetList(@ModelAttribute("cardVO") CardVO cardVO, Model model, HttpSession session) throws Exception{
		model.addAttribute("cardVO", new CardVO());
		String uid = (String) session.getAttribute("userId");
		model.addAttribute("bookMarkList", cardService.bookMarkList(uid));
		return "card/bookMarkList";
	}
	@RequestMapping(value = "/deleteBookMark", method = RequestMethod.GET)
	public String deleteBookMark(@ModelAttribute("cardVO") CardVO cardVO, HttpServletResponse response) throws Exception{
		int no=cardVO.no;
		int result = cardService.deleteBookMark(no);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시 시도해 주세요.');</script>"); 
			out.flush();
		}
		return "card/bookMarkList";
	}
	
		

}
