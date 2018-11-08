package kr.co.codin.repository.domain;

import java.util.HashMap;
import java.util.Map;

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
	

	
	
	
	public Map<String, Integer> PageLists = new HashMap<String,Integer>();
	
	
	
	
	public Map<String, Integer> getPageList() {
		return PageLists;
	}
	public void setPageList(Map<String, Integer> pageList) {
		PageLists = pageList;
	}




//	public class InnerPage{
//		public String AfirstPage;
//		public String AlastPage;
//		public String getAfirstPage() {
//			return AfirstPage;
//		}
//		public void setAfirstPage(String afirstPage) {
//			AfirstPage = afirstPage;
//		}
//		public String getAlastPage() {
//			return AlastPage;
//		}
//		public void setAlastPage(String alastPage) {
//			AlastPage = alastPage;
//		}
//		
//	}
	
}
