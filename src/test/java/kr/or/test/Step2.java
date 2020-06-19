package kr.or.test;

//ValueObject 클래스형 자료형
class MemberVO {
	private String name; private int age;
	private String phoneNum; //보안때문에 다른곳접근 못하기 위해 private씀.
	
	@Override
	public String toString() { //toString출력함수
		return "MemberVO클래스 [이름은" + name + ", 나이는" + age + ", 전화번호는" + phoneNum + "]";
	}
	//위에 어디 있는데 내꺼를 쓰겠다. override
	public String getName() {return name;} //클래스메서드호출시 돌려받을 값(string니 문자)이있는것.
	public void setName(String name) {this.name = name;}
	//void(는return false)는 값이 없으니 실행후 끝 this.name는 private에 있는 name.
	
	public int getAge() {return age;}
	public void setAge(int age) {this.age = age;}
	
	public String getPhoneNum() {return phoneNum;}
	public void setPhoneNum(String phoneNum) {this.phoneNum = phoneNum;}	
}//소스에서 get/set한번에 만들 수 있음.

class MemberService {
	//액션-서비스 클래스 - 출력용 메서드 작성
	//매개변수로 클래스배열(멤버스)을 받아서 출력하는 형태로 작성
	//memberVO를 배열로 변화시켜 받겠다. 
	
	// 배열 members에 들어있는 값을 처음부터 끝까지 차례차례 하나씩 꺼내서  MemberVO로 선언된 변수에 m에 담아서 출력.
		public void printMembers(MemberVO[] members) {//MemberVO클래스에 멤버스라는 변수명 받아서 처리
			for(MemberVO m : members) { //향상된 for(loop)문 사용  (형태 : 단일값 : 전체)
				//MemberVO클래스객체에의 m배열(단일)에 members(m1~m3)라는..하나하나 뽑아
				System.out.println("이름은" + m.getName() + " | 나이는" + m.getAge() + " | 전화번호는" + m.getPhoneNum());
		} }  }//insert,delete,service 등의 멤버스를 만들예정이라서 쓰는 것.

public class Step2 {
	public static void main(String[] args) {
		System.out.println("-----------------");
		System.out.println("클래스형 변수 - 사용자정의 자료형");
		// 클래스형 변수: 사용자 정의 자료형 사용하기(아래) / 값,배열 + 메소드까지들어갈수있어.
		// MemberVO 클래스를 실행하기 위해 new연산자를 이용해 객체(instance)생성
		// new쓰면 실행되는 class만들어짐
		MemberVO m1 = new MemberVO(); // step1은 안에 변수있었는데 step2는 MemberVO이용해 불러와서 할것
		m1.setName("홍길동"); //setter 메서드를 이용해 해당 인스턴스 변수(필드)에 값을 넣어준다.
		m1.setAge(45);
		m1.setPhoneNum("000-0000-0000");
		
		MemberVO m2 = new MemberVO(); //마찬가지로 다른 MemberVO객체(instance)를 생성해서 값을 넣는다.
		m2.setName("성춘향");
		m2.setAge(100);
		m2.setPhoneNum("111-1111-1111");
		
		MemberVO m3 = new MemberVO();
		m3.setName("각시탈");
		m3.setAge(3);
		m3.setPhoneNum("222-2222-2222");
		
		//크기가 3인 MemberVO클래스를(사용자정의자료형) 배열객체로 선언하면서,new연산자를 이용해 객체로 생성.
		MemberVO[] members = new MemberVO[3];
		// MemberVO배열클래스에 참조index에 m1, m2, m3를 넣어준다.
		//MemberVO배열클래스에 각각의 실행클래스(m1,m2,m3)의 자료를 넣어준다.
		members[0] = m1; //~[] {성춘향, 각시탈 등등} 같은거임.
		members[1] = m2;
		members[2] = m3;
		
		// 출력: MemberService 클래스를 사용
		MemberService ms = new MemberService();
		ms.printMembers(members); // 매개변수로 사용자정의자료형인 MemberVO배열을 넘겨준다. 호출해줘야 나옴. 
	} }