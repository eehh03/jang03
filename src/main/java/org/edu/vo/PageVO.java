package org.edu.vo;

public class PageVO {
	private int startBno;//null없음
	private int perPageNum;//null없음
	
	private Integer page; //jsp에서 받게되는데, null로 값이 올때 에러가 발생하지 않도록 Integer사용-클래스형 변수 만든거
	private int totalCount;
	private int endPage; 
	private int startPage;
	private boolean prev;
	private boolean next;
	//검색용 변수 2개 추가
	private String searchType;
	private String searchKeyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	private void calcPage() { //calc 계산기
		//page변수는 현재 jsp에서 클릭한 페이지 번호
		int tempEnd = (int)(Math.ceil(page / 10.0) * 10); 
		//ceil함수는 천장함수로 1.1 =2, 2.1=3으로 출력
		//반대되는 바닥함수로 floor(), 반올림함수로 round()가 있다. 
		//jsp에서 클릭한 페이지번호를 기준으로 끝 페이지를 계산한다.
		this.startPage = tempEnd - 9; //가상(tempEnd)으로 끝번호 계산해서 시작페이지를 계산.
		//시작페이지 계산 클릭한 page번호 10일때 까지 시작페이지는 1
		if(tempEnd * 10 > this.totalCount) { //totalCount-실제게시물개수
			//클릭한 page번호로 계산된 게시물 갯수가  totalCount 클때
			this.endPage = (int)Math.ceil(this.totalCount/10.0);
		}else {
			//클릭한 page번호로 계산된 게시물수가 실제게시물갯수 totalcount 작을 때
			this.endPage = tempEnd;
		}
		this.prev = this.startPage != 1; //startPage가 1보다 크면 무조건 이전 페이지가 있다.하면 true
		this.next = this.endPage * 10 < this.totalCount;
		//클릭한 page번호로 계산된 게시물수가 실제 게시물 갯수보다 작다면 다음페이지가 있다. 하면 true값
	}
	
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();//totalCount 전체게시물개수가 있어야지 페이지 계산을 할 수 있기 때문에
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getStartBno() {
		//DB쿼리에서 사용함. 시작데이터번호 = (페이지번호 - 1)*페이지당 보여지는 개수.
		startBno = (this.page - 1) * perPageNum;
		return startBno;
	}
	public void setStartBno(int startBno) {
		this.startBno = startBno;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}
