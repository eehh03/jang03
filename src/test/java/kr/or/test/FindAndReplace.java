package kr.or.test;

public class FindAndReplace {
//200612 11장 확인문제07 
	public static void main(String[] args) {
		String str = "모든 프로그램은 자바 언어로 개발될 수 있다"; //자바위치가 10번재임. 배열이기에 9나옴
		int index = str.indexOf("자바"); //index하면 자바라고 나오는 위치에 숫자가 나옴
				if(index == -1) {
					System.out.println("자바 문자열이 포함되어 있지 않습니다");
				}else {
					System.out.println("자바 문자열이 포함되어 있습니다.");
					System.out.println("인덱스값은 " + index + "입니다.");
					str = str.replace("자바", "java"); //영어로 바꾼것을 str=에 다시 넣어줌.
					System.out.println("-->" + str);
				}
	}
}