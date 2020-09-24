package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;//import해서 다른 패키지꺼 사용가능

public class MainController {

	private static final String TIME_SERVER = "pool.ntp.org";// MainControler 클래스 상수변수 선언

	public static void main(String[] args) throws IOException {
		// System.out.println("-----------------");
		MemberVO m1 = new MemberVO();
		m1.setName("장은화");
		m1.setAge(45);
		m1.setPhoneNum("000-0000-0000");

		MemberVO m2 = new MemberVO();
		m2.setName("장은화");
		m2.setAge(100);
		m2.setPhoneNum("111-1111-1111");

		MemberVO m3 = new MemberVO();
		m3.setName("장은화");
		m3.setAge(3);
		m3.setPhoneNum("222-2222-2222");
		// MemberVO 클래스를 사용하기 위해 new연산자 이용해 객체생성 후
		// setter메소드 이용해 필드에 값 넣어줌

		MemberVO[] members = new MemberVO[3];
		members[0] = m1;
		members[1] = m2;
		members[2] = m3;
		// MemberVO클래스를 크기3인 배열로 선언해 new연산자 이용해 객체 생성 후
		// m1,m2,m3를 각각 객체에 넣어줌.

		// 출력: MemberService 클래스를 사용위해 new연산자 이용해 객체 생성 후 MemberVO배열을 넘겨줌
		MemberService ms = new MemberService();
		ms.printMembers(members);

		// MainControl 클래스에 아래 내용 추가하 후 에러 상황 처리하기를 이용해서 외부 라이브러리 사용방법 확인
		System.out.println("-서버타임 출력하기-");
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(1000);
		try {
			timeClient.open();
		} catch (SocketException e) {
			System.out.println("open메서드 실행 오류");
			e.printStackTrace();
		}
		/*
		 * try-catch에서 예외가 발생시 catch에서 예외처리해준뒤 finally를 실행해주고 정상적으로 실행되면 바로 finally(에러나던
		 * 정상이던 항상 처리된다.)실행한다.
		 */
		InetAddress address = InetAddress.getByName(TIME_SERVER);
		TimeInfo timeInfo = timeClient.getTime(address);
		// 서버로부터 시간 가져오는 코드
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		Date date = new Date(returnTime);
		LocalDateTime localDateTime = date.toInstant().atZone(ZoneId.systemDefault()) // zoneID : 시간
				.toLocalDateTime();// date to LocalDateTime

		System.out.println("Server 시간: " + localDateTime);// 서버 시간
		System.out.println("로컬 PC 시간: " + LocalDateTime.now());
	}
}