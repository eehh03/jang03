package kr.or.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatConvert {

	public static void main(String[] args) {
	Date now = new Date(); //Date쓸 수있게 now라는 변수만들어 실행가능한 클래스로 만든것
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH시 mm분 ss초");
		System.out.println("현재 날짜와 시간은" + sdf.format(now));
	}//우리는 sdf 안씀. SimpleDateFormat을 원하는 시간으로 뽑을 수 있다는 것.

}
