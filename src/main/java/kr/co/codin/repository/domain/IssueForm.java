package kr.co.codin.repository.domain;

import java.util.List;

public class IssueForm {
	private String ticketSender;
	private String ticketTitle;
	private String ticketReceiver;
	private List<Integer> ticketSkill;
	private int ticketDifficulty;
	private String ticketStart;
	private String ticketEnd;
	public String getTicketSender() {
		return ticketSender;
	}
	public void setTicketSender(String ticketSender) {
		this.ticketSender = ticketSender;
	}
	public String getTicketTitle() {
		return ticketTitle;
	}
	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}
	public String getTicketReceiver() {
		return ticketReceiver;
	}
	public void setTicketReceiver(String ticketReceiver) {
		this.ticketReceiver = ticketReceiver;
	}
	public List<Integer> getTicketSkill() {
		return ticketSkill;
	}
	public void setTicketSkill(List<Integer> ticketSkill) {
		this.ticketSkill = ticketSkill;
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
	@Override
	public String toString() {
		return "IssueForm [ticketSender=" + ticketSender + ", ticketTitle=" + ticketTitle + ", ticketReceiver="
				+ ticketReceiver + ", ticketSkill=" + ticketSkill + ", ticketDifficulty=" + ticketDifficulty
				+ ", ticketStart=" + ticketStart + ", ticketEnd=" + ticketEnd + "]";
	}
	
	
}
