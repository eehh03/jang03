package kr.or.test;
import java.util.Calendar;
public class Step3 {

	public static void main(String[] args) {
		System.out.println("---------------------");
		System.out.println("외부 라이브러리를 사용한 열거형(enum) 자료형 소스");
		Week today = null; // Week 클래스 enum으로 만듦
		Calendar cal = Calendar.getInstance(); // 생성가능 인스턴스 cal변수 생성
		// Calendar cal = new Calendar()와 같은데 calendar은 위에처럼 만듬.
		int week = cal.get(Calendar.DAY_OF_WEEK); // week에 숫자가 들어옴.
		// System.out.println("Calendar클래스에서 리턴값으로 받은 오늘의 요일에 대한 정의 값(수)는" + week);

		switch (week) { // switch선택문이라함. 조건문x
		case 1:
			today = Week.일; break; // today에 어떤 값을 집어넣음. 1받으면 일임.
		case 2:
			today = Week.월; break;
		case 3:
			today = Week.화; break;
		case 4:
			today = Week.수; break;
		case 5:
			today = Week.목; break;
		case 6:
			today = Week.금; break;
		case 7:
			today = Week.토; break;
		}
		System.out.println("오늘 요일:" + today + "요일");
		if (today == Week.월) {
			System.out.println("월요일은 활기가 넘칩니다");
		} else {
			System.out.println("열심히 자바를 공부합니다.");
		}
	}
}