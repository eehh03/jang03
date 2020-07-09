package org.edu.controller;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

/**
 * 스프링 시큐리티 security-context.xml설정한 로그인 처리 결과 화면
 * @param
 * @
 * @return
 */
@RequestMapping(value = "/login_success", method = RequestMethod.GET)
public String login_success(Locale locale,HttpServletRequest request, RedirectAttributes rdat) {
	logger.info("Welcome login_success! The client locale is {}.", locale);
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	String username = "";//anonymousUser
	String levels = "";//ROLE_ANONYMOUS
	Boolean enabled = false;
	Object principal = authentication.getPrincipal();
	if (principal instanceof UserDetails) {
		enabled = ((UserDetails)principal).isEnabled();
	}
	HttpSession session = request.getSession();
	if (enabled) {
		Collection<? extends GrantedAuthority>  authorities = authentication.getAuthorities();
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_ANONYMOUS")).findAny().isPresent())
		{levels = "ROLE_ANONYMOUS";}
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_USER,")).findAny().isPresent())
		{levels = "ROLE_USER,";}
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent())
		{levels = "ROLE_ADMIN";}
		username =((UserDetails)principal).getUsername();
		//로그인 세션 저장
		session.setAttribute("session_enabled", enabled);//인증확인
		session.setAttribute("session_username", username);//사용자명
		session.setAttribute("session_levels", levels);//사용자권한
    	}
	rdat.addFlashAttribute("msg", "로그인");//result 데이터를 숨겨서 전송
	return "redirect:/";//새로고침 자동 등록 방지를 위해서 아래처럼 처리
}



/** 로그인 페이지 파일 입니다. 페이지 만들때 기본.*/
@RequestMapping(value = "/login", method = RequestMethod.GET)
public String login(Locale locale, Model model) {
	return "login";
}

/** slide 페이지 파일 입니다.*/
@RequestMapping(value = "/sample/slide", method = RequestMethod.GET)
public String slide(Locale locale, Model model) {
	return "sample/slide";
}

/** contact us 페이지 파일 입니다.*/
@RequestMapping(value = "/sample/contactus", method = RequestMethod.GET)
public String contactus(Locale locale, Model model) {
	return "sample/contactus";
}

/** blog 페이지 파일 입니다.*/
@RequestMapping(value = "/sample/blog", method = RequestMethod.GET)
public String blog(Locale locale, Model model) {
	return "sample/blog";
}

/** work 페이지 파일 입니다.*/
@RequestMapping(value = "/sample/work", method = RequestMethod.GET)
public String work(Locale locale, Model model) {
	return "sample/work";
}

/** we are 페이지 파일 입니다.*/
	@RequestMapping(value = "/sample/weare", method = RequestMethod.GET)
	public String weare(Locale locale, Model model) {
		return "sample/weare";
	}
	/** 샘플 파일 입니다.	*/
	@RequestMapping(value = "/sample/HTMLtest", method = RequestMethod.GET)
	public String HTMLtest(Locale locale, Model model) {
		return "sample/HTMLtest";
	}

	/** 샘플 파일 홈 입니다.	페이지 만들때 기본.*/
	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sample(Locale locale, Model model) {
		return "sample/home";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
}
