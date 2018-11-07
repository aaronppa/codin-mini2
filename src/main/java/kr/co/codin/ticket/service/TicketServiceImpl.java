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

	@Override
	public List<Ticket> ticketList(int userNo) {
		return mapper.ticketList(userNo);
	}

	@Override
	public Ticket ticketDetail(int ticketNo) {
		Ticket ticket = mapper.ticketDetail(ticketNo);
		ticket.setTicketEnd(ticket.getTicketEnd().substring(0, 10));
		
		return ticket;
	}

	@Override
	public List<TicketSkill> ticketSkillDetail(int ticketNo) {
		return mapper.ticketSkillDetail(ticketNo);
	}

	@Override
	public void updateReceiver(Ticket ticket) {
		mapper.updateReceiver(ticket);
	}

	@Override
	public List<Ticket> sendTicketList(int senderNo) {
		return mapper.sendTicketList(senderNo);
	}

	@Override
	public List<String> searchReceiver(int ticketNo) {
		return mapper.searchReceiver(ticketNo);
	}

	@Override
	public void updateSender(Ticket ticket) {
		mapper.updateSender(ticket);
	}

	@Override
	public void deleteSkill(int skillNo) {
		mapper.deleteSkill(skillNo);
	}

	@Override
	public Member searchMemberByNo(int memberNo) {
		return mapper.searchMemberByNo(memberNo);
	}

	@Override
	public void deleteTicket(int ticketNo) {
		mapper.deleteTicket(ticketNo);
	}

	@Override
	public void deleteReceiver(TicketGroup ticketGroup) {
		mapper.deleteReceiver(ticketGroup);
	}
}
