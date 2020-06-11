package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMembers(MemberVO[] members) {
		for (MemberVO m : members) {
			System.out.println("이름은" + m.getName() 
			+ " | 나이는" + m.getAge() + " | 전화번호는" + m.getPhoneNum());
		}//?.get~에 declaration 정의 implement 구현 같이 되어 있으나 분리예정
	}
}
