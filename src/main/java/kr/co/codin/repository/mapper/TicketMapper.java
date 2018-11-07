package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketSkill;

public interface TicketMapper {
	void insertTicket(Ticket ticket);
	List<String> autoCom();
	Member searchMember(String id);
	void insertGroup(TicketGroup group);
	void insertSkill(TicketSkill skill);
	List<Ticket> ticketList(int userNo);
	Ticket ticketDetail(int ticketNo);
	List<TicketSkill> ticketSkillDetail (int ticketNo);
	void updateReceiver(Ticket ticket);
	List<Ticket> sendTicketList(int senderNo);
	List<String> searchReceiver(int ticketNo);
	void updateSender(Ticket ticket);
	void deleteSkill(int skillNo);
	Member searchMemberByNo(int memberNo);
	void deleteTicket(int ticketNo);
	void deleteReceiver(TicketGroup ticketGroup);

}
