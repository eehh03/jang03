package kr.or.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
//200622 아마도
public class OpenApi {
	//외부연계 매서드
	public static void serviceApi() {
		BufferedReader br = null;//hrd넷에서 전송받은 데이터를 일시저장하는 저수지같은 역할
		String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML"
				+ "&authKey=인증키부분&pageNum=1&pageSize=10"
				+ "&srchTraStDt=20200622&srchTraEndDt=20200922&outType=1&sort=ASC&sortCol=TR_STT_DT";
		try {
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();//HttpURLConnection로 형변환
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"euc-kr"));//hrd넷에서 euc-kr로 보내줘서
			String result = "";
			String line;
			while((line = br.readLine()) != null) { //br에서 가지고 온 걸 line이라는 스트링변수에 하나씩 넣는거. null이 아니면 반복문 실행. 
				result = result + line + "\n"; //line에는 한줄씩 읽어온 값들어있음. 역슬래시는 줄바꿈
			} //1부터 100까지 더하는 로직과 같음. result에는 hrd에서 가져온 값있음?
			//System.out.println(result); //예쁘게 안나와서 XmlUtils이용해 println함
			String result_xmlUtils = XmlUtils.formatXml(result);
			System.out.println(result_xmlUtils);
					
		} catch (MalformedURLException e) { //URL에 대한 catch
			e.printStackTrace();
			
		} catch (IOException e) { // openConnection에 대한 catch
			e.printStackTrace();
		}
		//콘솔에 현재 시간 출력
				Calendar cal = Calendar.getInstance();
				System.out.println(cal.getTime());
	}

	public static void main(String[] args) {
		//실행간격 지정(5초)
		int sleepSec = 5;
		//주기적인 작업을 위한 코딩 exec 실행가능한 클래스 만듬.
		final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		exec.scheduleAtFixedRate(new Runnable() {
			public void run() {
					serviceApi();
			}
			
		}, 0, sleepSec , TimeUnit.SECONDS);//0:바로실행시켜라. 5초단위로
	}
}
