package kr.co.codin.repository.domain;

import java.util.Date;

public class Ticket {
	private int ticketNo;
	private String ticketTitle;
	private int ticket_sender;
	private char ticketDifficulty;
	private Date ticketStrart;
	private Date ticketEnd;
	private String ticketText;
	private int ticketProgress;
	
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
	public int getTicket_sender() {
		return ticket_sender;
	}
	public void setTicket_sender(int ticket_sender) {
		this.ticket_sender = ticket_sender;
	}
	public char getTicketDifficulty() {
		return ticketDifficulty;
	}
	public void setTicketDifficulty(char ticketDifficulty) {
		this.ticketDifficulty = ticketDifficulty;
	}
	public Date getTicketStrart() {
		return ticketStrart;
	}
	public void setTicketStrart(Date ticketStrart) {
		this.ticketStrart = ticketStrart;
	}
	public Date getTicketEnd() {
		return ticketEnd;
	}
	public void setTicketEnd(Date ticketEnd) {
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
	
	@Override
	public String toString() {
		return "Ticket [ticketNo=" + ticketNo + ", ticketTitle=" + ticketTitle + ", ticket_sender=" + ticket_sender
				+ ", ticketDifficulty=" + ticketDifficulty + ", ticketStrart=" + ticketStrart + ", ticketEnd="
				+ ticketEnd + ", ticketText=" + ticketText + ", ticketProgress=" + ticketProgress + "]";
	}
}
