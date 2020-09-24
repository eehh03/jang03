package kr.or.test;
public class Chatting {

	public static void main(String[] args) {
		 Chatting chat = new Chatting();//chat라는 클래스 변수를~ / 자기자신 입력한거
		chat.startChat("홍길동");//홍길동이 채팅 스타트하겠다.
	}

	void startChat(String chatId) {
		String nickName = chatId;
		Chat chat = new Chat() {

			@Override
			public void start() {
				while (true) {
					String inputData = " 채팅방 입장을 환영합니다!";
					String message = "[" + nickName + "]님" + inputData;
					sendMessage(message);
					break;
				} // end while
			}// end start()

		}; // end Chat 생성자 메소드
		chat.start(); // chat 클래스?에 start메소드를 불러줘
	} // end startChat()

	class Chat {
		void start() {}
		void sendMessage(String message) {
			System.out.println(message);
		}
	}
}