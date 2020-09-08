package kr.or.test;
//20200615 프로젝트에서는 안쓰나 thread알아야해서. 
//트레드 중지가능 그래도 백그라운드로 실행가능하나 interrupted가 있어여?
class MovieThread extends Thread{//Thread를 상속받음. Thread는 우리가 만든거 아닌 여기 들어있는것
	@Override //상속받았기에 재정의
	public void run() { //리턴값없는 run. MovieThread메소드 불러오면 자동재생되는 run메소드. Thread에 run메소드 있는거
		for(int cnt=0;cnt<3;cnt++) {
			System.out.println("동영상을 재생합니다");
		}
		while(true) {
			System.out.println("동영상을 무한재생합니다.");
			/*try {
				Thread.sleep(1); //0.001초 대기했다 지나감
			}catch(Exception e) {
				break;
			//스레드-실행중인 클래스가 메인()에서 interrupted()가 호출되었을 때 break해라. 
			}*/
			if(Thread.interrupted()) {//메인에서 인터럽트시킨 이벤트처리를 interrupted로 하는것
				System.out.println("인터럽트가 발생되었습니다. 반복문을 종료합니다.");
				break; //while문 빠져나가기 
			}
			
		}
	}
	
}

class MusicRunnable implements Runnable { //Runnable(인터페이스임)을 구현하는데 구현하는게 MusicRunnable받음.
	@Override 
	public void run() { 
		for(int cnt=0;cnt<3;cnt++) {
			System.out.println("음악을 재생합니다");
			try {
				Thread.sleep(1000); 
				} 
			catch (InterruptedException e) {
				System.out.println(e.toString());
			} 
		}
			
	}
	
}

public class ThreadUser {

	public static void main(String[] args) {
		Thread threadMovie = new MovieThread(); //Thread라는 클래스를 가져다 쓰는데
				//Thread라는 클래스를 실행가능하게 만드는 threadMovie변수를 만듦. MovieThread를 생성자메소드 이용해 threadMovie에 초기값넣음.
		//Thread라는 클래스형 변수를 만듦.
		//초기값은 movieThread라는 클래스에서 거져옴. 형태는 Thread라는 클래스. 
		//Thread를 변수로 만든거라 
		threadMovie.setDaemon(true);//threadMovie에서setDaemon메소드실행. 
		//threadMovie를 백그라운드로 실행하겠다고 설정.
		//setDaemon는 백그라운드 실행하겠다고 설정
		
		//main() 스레드에서 1초후 threadMovie를 안전하게 종료하는 코드
		//1초동안 대기한 이후에 threadMovie를 종료하는데 메소드가interrupt.
		threadMovie.start();//클래서형 변수. return없는 Thread에서  /thread 호출시 start써야
		
		try {
			Thread.sleep(1000);//메인 thread는 1초간 중지상태. 그러나 setDaemon로 돌아가게 했기에 메인 thread가 정지돼도 threadMovie.start()는 돌아가. 
			} 
		catch (InterruptedException e) {} //InterruptedException 클래스형 변수명이 e
		threadMovie.interrupt();//threadMovie를 중지하겠다고 중지하겠다는 메서드 실행.
		Thread ThreadMusic = new Thread(new MusicRunnable());//Thread안에 구현체(MusicRunnable) 집어 넣음.
		ThreadMusic.start();//ThreadMusic메소드에 start가 들어있음.
		
	}
}
