package org.edu.controller;

import java.util.List;

import javax.inject.Inject;

import org.edu.vo.MemberVO;
import org.edu.dao.IF_MemberDAO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JsonDataController {

	@Inject
	private IF_MemberDAO memberDAO;
	
	@RequestMapping(value="/android/login", method= RequestMethod.POST)
	public ResponseEntity<MemberVO> androidLogin(@RequestParam("txtUsername") String user_id,@RequestParam("txtPassword") String user_pw) {
		ResponseEntity<MemberVO> entity = null;
		try {
			
			MemberVO memberVO = memberDAO.viewMember(user_id);
			String bcryptPassword = memberVO.getUser_pw();
			//스프링 시큐리티 4.x BCryptPasswordEncoder 암호화 사용
			BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder(10);
			if(bcryptPasswordEncoder.matches(user_pw, bcryptPassword )){
				System.out.println("계정정보 일치");
				entity = new ResponseEntity<>(memberVO, HttpStatus.OK);//code 200
			}else{
				System.out.println("계정정보 불일치");
				entity = new ResponseEntity<>(HttpStatus.NO_CONTENT);//code 204
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);//code 400
		}
		return entity;
	}
	
	@RequestMapping(value="/android/list", method = RequestMethod.POST) //안드로이드 외부로그인용
	public ResponseEntity<List<MemberVO>> androidList() {
		ResponseEntity<List<MemberVO>> entity = null; //에러나지 않게 null로 그래서 return때 entity넣어줌.
		try {
			entity = new ResponseEntity<>(memberDAO.androidMember(), HttpStatus.OK);//생성자 이용해 초기값 설정. 클래스 변수(entity)에 값을 상단?
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}	
		return entity;
	}
	
	@RequestMapping(value = "/android/delete/{user_id}", method = RequestMethod.POST)
	public ResponseEntity<String> androiddelete(@PathVariable("user_id") String user_id) {
		ResponseEntity<String> entity = null; 
		try {
			memberDAO.deleteMember(user_id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); 
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}