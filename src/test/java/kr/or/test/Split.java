package kr.or.test;
import java.util.StringTokenizer;

public class Split {
//20200612 11장 확인문제
	public static void main(String[] args) {
		String str = "아이디,이름,패스워드";
		
		//방법1(splict() 메소드 이용)
		System.out.println("Split를 사용한 문자열 분리");
		String[] tokens = str.split(","); //str클래스에 split가 있음. regex 정규식
		int cnt = 0;
		for(String token : tokens) { //반복할때쓸값:받은값
			System.out.print("배열[" + (cnt++) + "]" + token); //반복한 변수 나옴.
		}
		System.out.println();
		
		//방법2(String Tokenizer 이용) 움직이는 데이터를 token이라고함. 일자로 배열하는것. 
		System.out.println("StringTokenizer을 이용한 문자열 분리");
		StringTokenizer st = new StringTokenizer(str, ",");
		//스트링은 new 안써도 썼는데?(String str은 안씀) 위에꺼 고전적인
		while(st.hasMoreTokens()) {//토큰안에 값있으면 돌아가고 없으면 안돌아감.
			String token = st.nextToken();
			System.out.println(token);
		}
	}
}