package org.edu.controller;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.edu.service.IF_MemberService;
import org.edu.vo.MemberVO;
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
	
	@Inject
	private IF_MemberService memberService; 
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

/**
 * 스프링 시큐리티 security-context.xml설정한 로그인 처리 결과 화면
 * @param local
 * @param request
 * @param rdat
 * @return
 * @throws Exception 
 */
@RequestMapping(value = "/login_success", method = RequestMethod.GET)
public String login_success(Locale locale,HttpServletRequest request, RedirectAttributes rdat) throws Exception {
	logger.info("Welcome login_success! The client locale is {}.", locale);
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	//getContext-컨텍트불러옴.그 중 getAuthentication(인증)만 가져옴. 그래서authentication-실행가능변수만듦
	String userid = "";//아이디 출력
	String levels = "";//ROLE_ANONYMOUS
	//세션변수로 쓰려고 만듦.
	Boolean enabled = false;//기본적으로 false. 사용가능한 회원인지 확인
	Object principal = authentication.getPrincipal();
	if (principal instanceof UserDetails) {//UserDetails-사용자 상세정보가져옴?
		// 인증이 처리되는 로직(아이디,암호를 스프링시큐리티 던져주고 인증은 스프링에서 알아서 해줌, )
		//UserDetails-에 아이디 암호보내지면 인증되었는지 보내주는 것. 우리는 아이디암호만 보내주면 자기가 실행
		enabled = ((UserDetails)principal).isEnabled();
	}//principal을 UserDetails형으로 사용가능한지 isEnabled에 집어넣음. Object-문자,숫자 될 수 있는 
	HttpSession session = request.getSession();//세션을 초기화 시켜줌. 권한체크위해 session만들어줌.
	if (enabled) {//인증처리가 완료된사용자의 권한체크 
		Collection<? extends GrantedAuthority>  authorities = authentication.getAuthorities();
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_ANONYMOUS")).findAny().isPresent())
		{levels = "ROLE_ANONYMOUS";}//로그인하지 않은 일반접속자.o에 리턴값줌
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_USER,")).findAny().isPresent())
		{levels = "ROLE_USER,";}
		if(authorities.stream().filter(o -> o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent())
		{levels = "ROLE_ADMIN";}
		userid =((UserDetails)principal).getUsername();
		//로그인 세션 저장. 이사람이 어떤 사람인지 세션으로 알고 홈페이지에서 쓰는것
		session.setAttribute("session_enabled", enabled);//인증확인
		session.setAttribute("session_userid", userid);//사용자아이디
		session.setAttribute("session_levels", levels);//사용자권한
		//==========상단은 스프링시큐리티에서 기본제공하는 세션 변수처리
		//==========하단은 우리가 추가하는 세션 변수처리
		//회원이름 구하기 추가
		MemberVO memberVO = memberService.viewMember(userid);
		session.setAttribute("session_username", memberVO.getUser_name());//사용자명
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
