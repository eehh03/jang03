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

public class OpenApi {
	//외부연계 매서드
	public static void serviceApi() {
		BufferedReader br = null;//hrd넷에서 전송받은 데이터를 일시저장하는 저수지같은 역할
		String urlstr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=nckWYMNufvUjGXFCb8FLuFLHQlqzXJPd&pageNum=1&pageSize=10&srchTraStDt=20200501&srchTraEndDt=20201231&outType=1&sort=DESC&sortCol=TR_STT_DT&crseTracseSe=C0055&srchTraArea1=44";
		try {
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();//HttpURLConnection로 형변환
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"euc-kr"));
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				//line이라는 스트링변수에 br에서 가지고 온 걸 하나씩 넣음. null이 아니면 반복문 실행. 
				result = result + line + "\n"; //line에는 한줄씩 읽어온 값 들어있음.
			} 
			//System.out.println(result); 
			//XmlUtils이용해 한줄을 라인별로 출력하게 함.
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
		//실행간격 지정(10초)
		int sleepSec = 10;
		//주기적인 작업을 위한 코딩 exec 실행가능한 클래스 만듬.
		final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		exec.scheduleAtFixedRate(new Runnable() {
			public void run() {
					serviceApi();
			}
			
		}, 0, sleepSec , TimeUnit.SECONDS);
	}
}
