package kr.or.test;
public class Step1 {

	public static void main(String[] args) {
		System.out.println("클래스를 사용하지 않는 내장변수 자료형 소스");
		String name; int age; String phoneNum;
		
		name = "홍길동"; age = 45; phoneNum = "000-0000-0000";
		printMenber(name, age,phoneNum); 
		name = "성춘향"; age = 100; phoneNum = "111-1111-1111";
		printMenber(name, age,phoneNum);
		name = "각시탈"; age = 3; phoneNum = "222-2222-2222";
		printMenber(name, age,phoneNum);			
	
	System.out.println("내장변수 배열자료형 소스");
	String[] names = {"홍길동", "성춘향", "각시탈"}; //배열이기에 복수라서 name뒤에 s붙임.
	int[] ages = {45, 100, 3};
	String[] phoneNums = {"000-0000-0000", "111-1111-1111", "222-2222-2222"};
	printMember(names, ages, phoneNums);
}
	
	//(중요)오버로드: 같은이름(printMember)이나 매개변수(파라미터:int등)가 틀린 메서드 
	//배열은 값을 참조할 때 주소(index)를 사용하는데 0번주소부터 시작. 
	private static void printMember(String[] names, int[] ages, String[] phoneNums) {
		int cntLength = names.length;
		System.out.println("매개변수 이름의 갯수는 " + cntLength); //디버그 한다고 표현. 
		
		for(int cnt=0; cnt<cntLength; cnt++) {
			System.out.println("이름은 " + names[cnt] + 
					"| 나이는 " + ages[cnt] + "| 전화번호는 " + phoneNums[cnt] +" 입니다");
	}}
	
	private static void printMenber(String name, int age, String phoneNum) {
			System.out.println("이름은 " + name + 
					"| 나이는 " + age + "| 전화번호는 " + phoneNum +" 입니다");
	}
}	