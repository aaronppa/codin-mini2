package kr.co.codin.ticket.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketSkill;

public interface TicketService {
	int insertTicket(Ticket ticket);
	void insertGroup(TicketGroup group);
	void insertSkill(TicketSkill skill);	
	List<String> autoCom();
	Member searchMember(String id);

}
