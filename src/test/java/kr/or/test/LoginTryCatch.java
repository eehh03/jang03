package kr.or.test;

class NotExistIDException extends Exception {
	//아이디 존재하지 않을 때 예외사항 처리내용
	public NotExistIDException() {}//자기와 똑같은 클래스는 생성자임. 생성자 메서드
	public NotExistIDException(String message) {//위랑 같으나 매개변수(String message)있는거.
		super(message);//super는 부모의 어떤 것을 하라는 말.
	}
}
class WrongPasswordException extends Exception{//앞에가 우리가 만든거고 Exception은 받은거.
	//패스워드 입력오류에 대한 예외사항 처리내용
	public WrongPasswordException() {} //생성자 메서드
	public WrongPasswordException(String message) {
		super(message);
	}
}
public class LoginTryCatch {
	public static void main(String[] args) {
		try {
			login("white", "12345");//로그인1
		} catch (NotExistIDException e) {
			e.printStackTrace();
		} catch (WrongPasswordException e) {
			e.printStackTrace();
		}
		try {
			login("blue", "54321");//로그인2
		} catch (NotExistIDException e) {
			e.printStackTrace();
		} catch (WrongPasswordException e) {
			e.printStackTrace();
		}
	}
	
	public static void  login(String id, String password ) 
			throws NotExistIDException, WrongPasswordException {
		//아이디가 blue가 아니라면 NotExistIDException 발생시킴
		if(!id.equals("blue")) {
			throw new NotExistIDException("아이디가 존재하지 않습니다.");
		}//강제로 오류예외 발생시킴 : NotExistIDException
		
		//패스워드가 1234가 아니라면 WrongPasswordException 발생시킴
		if(!password.equals("12345")) {
			throw new WrongPasswordException("패스워드가 일치하지 않습니다.");
		}//강제로 오류예외 발생시킴 : WrongPasswordException 왜.테스트 위해
	}
}