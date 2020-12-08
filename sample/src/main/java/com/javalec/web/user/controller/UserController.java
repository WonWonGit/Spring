package com.javalec.web.user.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.ibatis.annotations.Update;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javalec.web.sample.model.CardVO;
import com.javalec.web.user.model.UserVO;
import com.javalec.web.user.service.UserService;

@Controller
@RequestMapping(value="/card")
public class UserController {

	private static final Logger logger = 
			LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService userService;
	
	//회원가입
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletResponse response) throws Exception {
		int result = userService.insertUser(userVO);
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 존재하는 아이디입니다.');location.href='/card/signup';</script>"); 
			out.flush();
		}
		return "redirect:/card/signup";
	}
	
	
	//로그인
	@RequestMapping(value = "/getLogin", method = RequestMethod.POST)
	public String getLogin(UserVO userVo, HttpSession session,HttpServletResponse response) throws Exception {
		UserVO result = userService.getLogin(userVo);
		if(result==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보가 틀립니다.');</script>"); 
			out.flush();
			System.out.println("fail");
			return "login/signup";
		}else {
			session.setAttribute("userId", userVo.getUid());
			System.out.println("ok");
			System.out.println(userVo.getUid());
			return "redirect:/card/card";
		}
		
	}
	
	//회원가입
	@RequestMapping(value="/signup", method = RequestMethod.GET)
		public String signup(Model model) throws Exception{
			model.addAttribute("userVO", new UserVO());
			return "login/signup";
			
		}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(UserVO uservo , Model model, HttpSession session) {
		session.invalidate();		

		return "redirect:/card/card";
	}
	@RequestMapping(value="/card",method=RequestMethod.GET)
	public String getMember(Model modelu) throws Exception {
		modelu.addAttribute("member",userService.getMember());
		modelu.addAttribute("cardVO", new CardVO());
		
		return "card/index";
	}
	}
