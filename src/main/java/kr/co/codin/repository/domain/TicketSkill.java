package kr.co.codin.repository.domain;

public class TicketSkill {

	private int skillNo;
	private int ticketNo;
	private int skillCode;
	
	public int getSkillNo() {
		return skillNo;
	}
	public void setSkillNo(int skillNo) {
		this.skillNo = skillNo;
	}
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public int getSkillCode() {
		return skillCode;
	}
	public void setSkillCode(int skillCode) {
		this.skillCode = skillCode;
	}
	@Override
	public String toString() {
		return "TicketSkill [skillNo=" + skillNo + ", ticketNo=" + ticketNo + ", skillCode=" + skillCode + "]";
	}
	
}
