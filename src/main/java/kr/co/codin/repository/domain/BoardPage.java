package kr.co.codin.repository.domain;

public class BoardPage {
	
	private int pageNo;

	public int getPageNo() {
	
		return pageNo;//여길안옴
	}
	public void setPageNo(int PageNo) {
		
		this.pageNo = PageNo;
	}
	private int end;
	private int begin;
	
	public int getEnd() {
		return pageNo * 10;
	}
	
	//#{begin}
	public int getBegin() {
		return (pageNo -1)*10 +1;
	}
	
	
	private int endPage;

	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
}
