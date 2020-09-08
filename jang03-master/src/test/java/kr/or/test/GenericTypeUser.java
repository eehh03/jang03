package kr.or.test;

import java.util.HashMap;
import java.util.Map;

//20015 제네릭타입클래스 생성. 여기서는 매개변수여러개써서 
class Container<T>{
	private T t;
	public void set(T t) {
		this.t = t;
	}
	public T get(){
	return t;
	}
}

class ContainerKV<K, V> {
	private K key; //K클래스형 변수 key
	private V value;
	
	public void set(K key, V value) {
		this.key = key;
		this.value = value;//셋저장시 한꺼번에 저장.
	}
	public K getKey() {
		return key; //이 key는 저장된 (this.key)키값임.
	}
	public V getValue() {
		return value;
	}
	
}
public class GenericTypeUser {

	public static void main(String[] args) {
	
		ContainerKV<String, String> containerKV1 
		= new ContainerKV<String, String>();
		containerKV1.set("name", "길동");
		String nameK = containerKV1.getKey();
		String nameV = containerKV1.getValue();
		System.out.println("입력된 ContainerKV변수의 키:" + nameK);
		System.out.println("입력된 ContainerKV변수의 값:" + nameV);
		
		//실무는 아래더 많이 씀.
		Map<String, String> tableKV = new HashMap<String, String>();//사용자정의형으로 데이터넣을때.
		tableKV.put("userid", "user02");
		tableKV.put("userpw", "1234");
		tableKV.put("username", "길동 홍");
		//tableKV.put("age", "3");//age key에 값 입력.
		System.out.println("아이디: " + tableKV.get("userid"));//age라는key에 값을 가져오는
		System.out.println("암호: " + tableKV.get("userpw"));
		System.out.println("이름: " + tableKV.get("username"));
		
		Container<String> container1= new Container<String>();
	container1.set("홍길동");
	//컨테이너1 t변수:스트링 홍길동 들어감
	String str = container1.get();
	
	Container<Integer> container2 = new Container<Integer>();
	//컨테이너2 t변수:인티저 정수형 6이 들어감.
	container2.set(6);
	int age = container2.get();//get은 매개변수없어서 그냥 ()만.
	String name = container1.get(); //네임변수에는 컨테이너1에 해당되는 값 들어감.
	System.out.println("이름은:" + name +  " 나이는" + age + "살");
//메소드 오버로드와 비슷. 둘다 Container인데 매개변수(String,Integer)만 달라서
	}

}
