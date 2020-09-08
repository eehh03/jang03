package kr.or.member;

public class MemberVO {
	private String name;
	private int age;
	private String phoneNum;
//MemberVO에 필드를 생성

	// getter, setter 메소드 - 다른 클래스에서도 접근할 수 있도록 접근제한자는 public
	// getName 메소드를 다른 곳에서 호출하면 이 클래스의 필드의 name변수에 저장된 값을 돌려줌.
	@Override // 오버라이딩 -부모메소드를 자식클래스에서 재정의 함.
	public String toString() {
		return "MemberVO클래스 [이름은" + name + ", 나이는" + age + ", 전화번호는" + phoneNum + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
}/*
	 * 매개변수 name을 필드 name에 저장. 매개변수이름과 필드 이름이 동일해서 this를 앞에 붙여서 this.name이 필드인 것을
	 * 알려줌.
	 */
