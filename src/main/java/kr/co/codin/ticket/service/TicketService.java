package kr.co.codin.ticket.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketPage;
import kr.co.codin.repository.domain.TicketSkill;

public interface TicketService {
	int insertTicket(Ticket ticket);
	List<String> autoCom();
	Member searchMember(String id);
	void insertGroup(TicketGroup group);
	void insertSkill(TicketSkill skill);	
	List<Ticket> ticketList(TicketPage page);
	Ticket ticketDetail(int ticketNo);
	List<TicketSkill> ticketSkillDetail (int ticketNo);
	void updateReceiver(Ticket ticket);
	List<Ticket> sendTicketList(TicketPage page);
	List<String> searchReceiver(int ticketNo);
	void updateSender(Ticket ticket);
	void deleteSkill(int skillNo);
	Member searchMemberByNo(int memberNo);
	void deleteTicket(int ticketNo);
	void deleteReceiver(TicketGroup ticketGroup);
	int sendTicketCount(int memberNo);
	int ticketCount(int memberNo);

}
