package kr.or.test;
import java.util.regex.Pattern;

public class RegEx {
	//정규표현식 20200612 11장 연습문제 10번 
	public static void main(String[] args) {
		String id = "A12345678900";
		String regExp = "[a-zA-Z][a-zA-z0-9]{7,11}"; 
		//7~11자 사이만 가능(문제에 8~12자 사이의 ID값인지 검사하고 싶다고 해서)
		boolean isMatch = Pattern.matches(regExp, id); 
		//맞는지 안맞는지 isMatch변수. 우리가쓴 아이디랑 정규식이 맞는지안맞는지? 
		if(isMatch) {
			System.out.println("아이디로 사용가능 합니다.");
		}else {
			System.out.println("아이디는 7~11자까지, 영문 소문자만 사용가능합니다. ");
		}
	}
}