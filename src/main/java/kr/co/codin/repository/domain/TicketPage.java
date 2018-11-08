package kr.co.codin.repository.domain;

public class TicketPage {
	// 페이지 번호
	private int pageNo;
	private int pageNum = 5;
	private int memberNo;
	
	public TicketPage () {
		;;
	}
	
	public TicketPage (int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

//	private int begin;
//	private int end;

	// #{end}
	public int getEnd() {
		return pageNo*pageNum;
	}

	// #{begin}
	public int getBegin() {
		return ((pageNo-1)*pageNum);
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	
}
