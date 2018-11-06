package kr.co.codin.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketSkill;
import kr.co.codin.repository.mapper.TicketMapper;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketMapper mapper;

	@Override
	public int insertTicket(Ticket ticket) {
		mapper.insertTicket(ticket);
		return ticket.getTicketNo();
	}

	@Override
	public List<String> autoCom() {
		return mapper.autoCom();
	}

	@Override
	public Member searchMember(String id) {
		return mapper.searchMember(id);
	}

	@Override
	public void insertGroup(TicketGroup group) {
		mapper.insertGroup(group);
	}

	@Override
	public void insertSkill(TicketSkill skill) {
		mapper.insertSkill(skill);
	}
}
