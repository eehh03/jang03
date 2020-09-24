package kr.or.test;

import java.util.ArrayList;
import java.util.List;

//import java.util.Scanner;

class Tire { 
public void run() { //메서드=함수=function()
System.out.println("일반 타이어가 굴러갑니다");
	}
}
class SnowTire extends Tire { //상속 =extends=>오른쪽이 부모 Tire에서 확장된게 SnowTire 
	public void run() {
		System.out.println("스노우 타이어가 굴러갑니다.");
	}
}

public class HelloWorld {
	public static void main(String[] args) {
		//(page:jsp클릭변수 - 1) * perPageNum:페이지당 보여줄 개수;
		int startBno = (1 - 1) * 10; //1페이지.
		System.out.println("쿼리변수 (1page - 1) * perPageNum = " + startBno);
		startBno = (2 - 1) * 10; //2페이지.
		System.out.println("쿼리변수 (2page - 1) * perPageNum = " + startBno);
		startBno = (3 - 1) * 10; //3페이지.
		System.out.println("쿼리변수 (3page - 1) * perPageNum = " + startBno);

		
		//천장함수 사용법 1(0)페이지, 2(1)페이지, 3(2)페이지 
		//마지막 페이지의 계산식
		int endpage = (int)(Math.ceil(1/10.0) * 10); //startBno 게시물 시작번호
		System.out.println("Math.ceil(1page/10.0) * 10) = " + endpage); //1페이지 전송받았을 때
		endpage = (int)(Math.ceil(2/10.0) * 10); 
		System.out.println("Math.ceil(2page/10.0) * 10) = " + endpage); 
		endpage = (int)(Math.ceil(3/10.0) * 10); //0.9->1, 1.1->2 출력
		System.out.println("Math.ceil(3page/10.0) * 10) = " + endpage); 
		/*2
		ex) ceil(1.1) = 2, flore(1.1) =1
		1*/
		
		//1페이지 클릭해도 end페이지는 10
		//2페이지 -> 10
	    //11페이지 -> 20
		List<String> files = new ArrayList<>();
		files.add("sample1.jpg");
		files.add("sample2.jpg");
		files.add("sample3.jpg");
		String[] filenames = new String[files.size()];
		int cnt = 0;
		for(String fileName : files) {
			filenames[cnt++] = fileName;//실제뽑은 fileName을 하나씩 꺼냄.
		}
		System.out.println(filenames[0] + filenames[1] + filenames[2]);
		
		//SnowTire클래스형 변수 snowTire 생성, 
		//new 키워드로 SonwTire()매서드를 이용해서 snowTire인스턴스(메모리에로딩) 실행된상태.
		SnowTire snowTire = new SnowTire(); //생성자 메서드
		Tire tire = snowTire;
		tire.run(); //자식클래스의 run()메소드 실행된 것.
		Tire tire2 = new Tire();
		tire2.run(); //부모클래스의 run()메소드 실행된 것.
		} 
	}

/*boolean run = true;
int balance = 0;
Scanner scanner = new Scanner(System.in);

while(run) {
System.out.println("--------------------------");
System.out.println("1.입금|2.출금|3.잔고|4.종료");
System.out.println("--------------------------");
System.out.print("위 번호를 입력해 주세요>");
int menuNum = scanner.nextInt(); 

switch(menuNum) {
case 1:
	System.out.print("입금액을 입력 하세요> ");
	balance = balance + scanner.nextInt();
	break;
case 2:
	System.out.print("출금액을 입력 하세요> ");
	balance = balance - scanner.nextInt();
	break;
case 3:
	System.out.println("잔액은" + balance + "원 입니다.");
	break;
case 4:
	System.out.println("프로그램이 종료되었습니다.");
	run = false; //break만 하면 case만 빠져나가기 때문에 while문을 빠져나가는 명령
	break; // switch문을 빠져나가는 명령 
} 
}
System.out.println(); */



/*boolean run = true;
int balance = 0;
Scanner scanner = new Scanner(System.in); //System.in은 입출력정의 - 키보드로 
while(run) {
	//ln = line new = 엔터
	System.out.println("1.입금|2.출금|3.잔고|4.종료");
	System.out.print("위 번호를 입력해 주세요>");
	int menuNum = scanner.nextInt(); 
	//키보드에 입력받은 숫자를 menuNum에 초기값으로 지정
	if(menuNum==1) {
		System.out.print("입금액을 입력 하세요> ");
		balance = balance + scanner.nextInt();
	}
	if(menuNum==2) {
		System.out.print("출금액을 입력 하세요> ");
		balance = balance - scanner.nextInt();
	}
	if(menuNum==3) {
		System.out.println("잔액은" + balance + "원 입니다.");
	}
	if(menuNum==4) {
		System.out.println("프로그램이 종료되었습니다.");
		break; //run = false;
}} //end while문
*/

/*int sum = 0;
int cnt = 1 ;

for(cnt=1;cnt<=100;cnt++) { //cnt = cnt + 1
sum = sum + cnt; //sum은 누적변수, cnt는 증가변수
}

while(cnt<=100) {
	sum = sum + cnt;
	cnt = cnt+1;
}
System.out.println("1부터" + (cnt-1) +"까지의 합은" + sum + "입니다.");*/

/*int x = 10;
int y = 5;
boolean result1, result2, result3 ; //불린형 변수지정
//true=1, false=0;
result1 = (x>7)&&(y<=5); //비교구문 1 * 1 = 1
result2 = (x<7)&&(y<=5); //0 * 1 = 0 
result3 = (x<7)||(y<=5); //0 + 1 = 1
System.out.println
("1번:" + result1 + "/2번:" + result2 + "/3번:" + result3);*/

/*int score = 85;
String result; //result = (!(score>90))?"가" : "나"; //삼항 조건 축약문 -?-:-
if(!(score>90)) {
	result = "가";
}else {
	result = "나";
}
System.out.println("조건에 맞는 답은 " + result);*/

/*String name = "123"; //문자열형
char var3 = 'a'; //단일문자형
int num_name = Integer.parseInt(name); //변수형 변환(string -> int로)
System.out.println(num_name + "님 안녕하세요. 자바!");*/
