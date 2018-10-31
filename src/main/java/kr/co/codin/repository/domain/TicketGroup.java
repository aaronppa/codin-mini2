package kr.co.codin.repository.domain;

public class TicketGroup {

	private int groupNo;
	private int ticketNo;
	private int groupMember;
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public int getGroupMember() {
		return groupMember;
	}
	public void setGroupMember(int groupMember) {
		this.groupMember = groupMember;
	}
	@Override
	public String toString() {
		return "TicketGroup [groupNo=" + groupNo + ", ticketNo=" + ticketNo + ", groupMember=" + groupMember + "]";
	}
	
	
}
