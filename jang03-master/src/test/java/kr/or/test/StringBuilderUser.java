package kr.or.test;

public class StringBuilderUser {
//하드?제어할때 많이 쓰임. 2020012 11장 확인문제 9번?
	public static void main(String[] args) {
		String str = "";
		for(int cnt=1;cnt<=100;cnt++) {
			str +=cnt; //str = str +cnt
			//문자열 숫자 더하면 문자열
		}
		System.out.println(str);
		
		StringBuilder sb = new StringBuilder();
		for(int cnt=1;cnt<=100; cnt++) {
			sb.append(cnt); //더해지지 않고 append있음으로 옆에가 붙여서 확장하는 것
		}
		str = sb.toString(); //str을 문자열로 출력
		System.out.println(str);
	}
}