package kr.co.codin.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.Ticket;
import kr.co.codin.repository.domain.TicketGroup;
import kr.co.codin.repository.domain.TicketPage;
import kr.co.codin.repository.domain.TicketPageResult;
import kr.co.codin.repository.domain.TicketSkill;
import kr.co.codin.ticket.service.TicketService;

@Controller
@RequestMapping("ticket")
public class TicketController {

	@Autowired
	private TicketService service;
	
	@RequestMapping("list.do")
	public void list(Model model, HttpSession session, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {

		int ticketNum = 10;
		int pageNum = 10;
		
		TicketPage page = new TicketPage(ticketNum);
		page.setPageNo(pageNo);
		
		Member member = (Member) session.getAttribute("user");
		page.setMemberNo(member.getMemberNo());

		List<Ticket> list = service.ticketList(page);
		
		model.addAttribute("list", list);
		
		System.out.println(service.ticketCount(member.getMemberNo()));
		model.addAttribute("pageResult", new TicketPageResult(pageNo, service.ticketCount(member.getMemberNo()), ticketNum, pageNum));
	}
	
	@RequestMapping("issue.do")
	public void issue() {}

	@RequestMapping("submit.do")
	@ResponseBody
	public void issueSubmit(Ticket ticket, String[] groupMember, int[] ticketSkill) {
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
		return service.searchMember(memberId);
	}
	
	@RequestMapping("detail.do")
	public void detail(Model model, int ticketNo) {
		model.addAttribute("ticket", service.ticketDetail(ticketNo));
		model.addAttribute("ticketSkill", new Gson().toJson(service.ticketSkillDetail(ticketNo)));
		
	}
	
	@RequestMapping("sendDetail.do")
	public void sendDetail(Model model, int ticketNo) {
		Ticket ticket = service.ticketDetail(ticketNo);
		List<String> receiverList = service.searchReceiver(ticketNo);
		
		
		model.addAttribute("ticket", ticket);
		model.addAttribute("ticketSkill", new Gson().toJson(service.ticketSkillDetail(ticketNo)));
		model.addAttribute("receiver", receiverList.toString().replace("[", "").replace("]", ""));
	}
	
	@RequestMapping("updateReceiver.do")
	@ResponseBody
	public void updateReceiver(int ticketNo, String addText, String userName, int progress) {
		
		Ticket ticket = new Ticket();
		ticket.setTicketNo(ticketNo);
		String updateText = service.ticketDetail(ticketNo).getTicketText();
		if (addText != "") {
			updateText += ("&#10;" 
						+ "------------------------------------------------------------"
						+ "&#10;" 
						+ "[" + userName + "]&#10;"
						+ addText);
		}
		ticket.setTicketText(updateText);
		ticket.setTicketProgress(progress);
		service.updateReceiver(ticket);
	}
	
	@RequestMapping("updateSender.do")
	@ResponseBody
	public void updateSender(Ticket ticket, int[] ticketSkill) {
		
		String addText = ticket.getTicketText();
		String updateText = service.ticketDetail(ticket.getTicketNo()).getTicketText();
		if (addText != "") {
			updateText += ("&#10;" 
						+ "------------------------------------------------------------"
						+ "&#10;" 
						+ "[" + service.searchMemberByNo(ticket.getTicketSender()).getMemberName() + "]&#10;"
						+ addText);
		}
		ticket.setTicketText(updateText);
		
		service.updateSender(ticket);
		
		List<TicketSkill> orgSkillList = service.ticketSkillDetail(ticket.getTicketNo());

		for (TicketSkill orgSkill : orgSkillList) {
			boolean exist = false;
			int SkillCode = orgSkill.getSkillCode();
			
			for (int updateSkill : ticketSkill) {
				if (SkillCode == updateSkill) exist = true; 
			}

			if (!exist) service.deleteSkill(orgSkill.getSkillNo());
		}
		
		for (int updateSkill : ticketSkill) {
			boolean exist = false;  
			
			for (TicketSkill orgSkill : orgSkillList) {
				if (orgSkill.getSkillCode() == updateSkill) exist = true; 
			}
			
			if(!exist) {
				TicketSkill newSkill = new TicketSkill();
				newSkill.setSkillCode(updateSkill);
				newSkill.setTicketNo(ticket.getTicketNo());
				service.insertSkill(newSkill);
			}
		}

	}

	@RequestMapping("sendList.do")
	public void sendList(Model model, HttpSession session, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		
		// 초기 설정 
		int ticketNum = 10;
		int pageNum = 10;
		
		TicketPage page = new TicketPage(ticketNum);
		page.setPageNo(pageNo);
		
		Member member = (Member) session.getAttribute("user");
		page.setMemberNo(member.getMemberNo());

		List<Ticket> list = service.sendTicketList(page);
		Map<Integer, String> recevierMap= new HashMap<>();
		
		for (Ticket ticket : list) {
			int ticketNo = ticket.getTicketNo();
			List<String> receiverList = service.searchReceiver(ticketNo);
			String key = "";
			if (receiverList.size() > 3) {
				key = receiverList.subList(0, 3).toString();
				key += "...";
			} else {
				key = receiverList.toString();	
			}
			recevierMap.put(ticketNo, key.replace("[", "").replace("]", ""));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("receiver", recevierMap);
		
		System.out.println(service.sendTicketCount(member.getMemberNo()));
		model.addAttribute("pageResult", new TicketPageResult(pageNo, service.sendTicketCount(member.getMemberNo()), ticketNum, pageNum));
	}
	
	@RequestMapping("deleteSender.do")
	@ResponseBody
	public void delteSender(int ticketNo) {
		service.deleteTicket(ticketNo);
	}
	
	@RequestMapping("deleteReceiver.do")
	@ResponseBody
	public void deleteReceiver(TicketGroup ticketGroup) {
		service.deleteReceiver(ticketGroup);
	}
}
