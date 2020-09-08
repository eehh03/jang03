package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMembers(MemberVO[] members) {
		for (MemberVO m : members) {
			System.out.println("-----------------");
			System.out.println(m.getName());
			System.out.println(m.getAge() + "세");
			System.out.println(m.getPhoneNum());
		}
	}
}//for문을 이용해 배열members에서 들어있는 값을 처음부터 끝까지 차례차례 하나씩 꺼내서 선언된 변수에 m에 담아서 출력. 

