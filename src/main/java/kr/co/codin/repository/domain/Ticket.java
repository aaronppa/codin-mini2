package kr.co.codin.repository.domain;

import java.util.Date;

public class Ticket {
	private int ticketNo;
	private String ticketTitle;
	private int ticketSender;
	private int ticketDifficulty;
	private String ticketStart;
	private String ticketEnd;
	private String ticketText;
	private Date ticketDate;
	private int ticketProgress;
	
	private Member member;
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getTicketTitle() {
		return ticketTitle;
	}
	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}
	public int getTicketSender() {
		return ticketSender;
	}
	public void setTicketSender(int ticketSender) {
		this.ticketSender = ticketSender;
	}
	public int getTicketDifficulty() {
		return ticketDifficulty;
	}
	public void setTicketDifficulty(int ticketDifficulty) {
		this.ticketDifficulty = ticketDifficulty;
	}
	public String getTicketStart() {
		return ticketStart;
	}
	public void setTicketStart(String ticketStart) {
		this.ticketStart = ticketStart;
	}
	public String getTicketEnd() {
		return ticketEnd;
	}
	public void setTicketEnd(String ticketEnd) {
		this.ticketEnd = ticketEnd;
	}
	public String getTicketText() {
		return ticketText;
	}
	public void setTicketText(String ticketText) {
		this.ticketText = ticketText;
	}
	public int getTicketProgress() {
		return ticketProgress;
	}
	public void setTicketProgress(int ticketProgress) {
		this.ticketProgress = ticketProgress;
	}
	public Date getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(Date ticketDate) {
		this.ticketDate = ticketDate;
	}
	@Override
	public String toString() {
		return "Ticket [ticketNo=" + ticketNo + ", ticketTitle=" + ticketTitle + ", ticketSender=" + ticketSender
				+ ", ticketDifficulty=" + ticketDifficulty + ", ticketStart=" + ticketStart + ", ticketEnd=" + ticketEnd
				+ ", ticketText=" + ticketText + ", ticketDate=" + ticketDate + ", ticketProgress=" + ticketProgress
				+ ", member=" + member + "]";
	}


	
}
