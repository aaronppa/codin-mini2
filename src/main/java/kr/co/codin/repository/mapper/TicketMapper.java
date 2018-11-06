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
	int searchMemberNo(String id);
	void insertGroup(TicketGroup group);
	void insertSkill(TicketSkill skill);

}
