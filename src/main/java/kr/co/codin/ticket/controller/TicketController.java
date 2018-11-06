package kr.co.codin.ticket.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketSkill;
import kr.co.codin.ticket.service.TicketService;

@Controller
@RequestMapping("ticket")
public class TicketController {

	@Autowired
	private TicketService service;
	
	@RequestMapping("list.do")
	public void list() {}
	
	@RequestMapping("issue.do")
	public void issue() {}

	@RequestMapping("submit.do")
	@ResponseBody
	public void issueSubmit(Ticket ticket, String[] groupMember, int[] ticketSkill) {
		System.out.println(ticket);
		System.out.println(Arrays.toString(groupMember));
		System.out.println(Arrays.toString(ticketSkill));
		int ticketNo = service.insertTicket(ticket);
		
		for (int i = 0; i < groupMember.length; i++) {
			TicketGroup group = new TicketGroup();
			group.setTicketNo(ticketNo);
			group.setGroupMember(service.searchMember(groupMember[i]).getMemberNo());
			service.insertGroup(group);
		}
		
		for (int i = 0; i < ticketSkill.length; i++) {
			TicketSkill skill = new TicketSkill();
			skill.setTicketNo(ticketNo);
			skill.setSkillCode(ticketSkill[i]);
			service.insertSkill(skill);
		}
	}
	
	@RequestMapping("autoCom.do")
	@ResponseBody
	public List<String> autoCom() {
		return service.autoCom();
	}
		
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Member searchMember(String memberId) {
		System.out.println("searchMember invoked");
		return service.searchMember(memberId);
	}
	
	@RequestMapping("detail.do")
	public void detail() {}
	
	@RequestMapping("sendList.do")
	public void sendList() {}
}
