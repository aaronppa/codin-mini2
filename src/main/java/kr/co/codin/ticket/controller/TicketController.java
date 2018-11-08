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
	
	// 수신 티켓 리스트 목록 정렬
	// 페이징 적용 완료
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
		
		model.addAttribute(
				"pageResult", 
				new TicketPageResult(
						pageNo, 
						service.ticketCount(member.getMemberNo()), 
						ticketNum, 
						pageNum));
	}
	
	// 티켓 발급 페이지 이동
	@RequestMapping("issue.do")
	public void issue() {}

	// 티켓 발급 제출 코드
	@RequestMapping("submit.do")
	@ResponseBody
	public void issueSubmit(Ticket ticket, String[] groupMember, int[] ticketSkill) {

		//제너레이터 키 활용, 방금 입력 된 티켓의 PK를 가져옴
		int ticketNo = service.insertTicket(ticket);
		
		//티켓 수신자 목록을 그룹화 하여 입력
		for (int i = 0; i < groupMember.length; i++) {
			TicketGroup group = new TicketGroup();
			group.setTicketNo(ticketNo);
			group.setGroupMember(service.searchMember(groupMember[i]).getMemberNo());
			service.insertGroup(group);
		}
		
		//티켓 스킬 목록을 그룹화 하여 입력
		for (int i = 0; i < ticketSkill.length; i++) {
			TicketSkill skill = new TicketSkill();
			skill.setTicketNo(ticketNo);
			skill.setSkillCode(ticketSkill[i]);
			service.insertSkill(skill);
		}
	}
	
	// 수신자 자동 완성 기능
	// 문자 배열만 반환 필요
	@RequestMapping("autoCom.do")
	@ResponseBody
	public List<String> autoCom() {
		return service.autoCom();
	}
		
	// 수신자 입력 시, Member 존재 여부 확인 코드
	@RequestMapping("searchMember.do")
	@ResponseBody
	public Member searchMember(String memberId) {
		return service.searchMember(memberId);
	}
	
	// 수신 티켓 세부 사항 조회
	@RequestMapping("detail.do")
	public void detail(Model model, int ticketNo) {
		model.addAttribute("ticket", service.ticketDetail(ticketNo));
		model.addAttribute("ticketSkill", new Gson().toJson(service.ticketSkillDetail(ticketNo)));
		
	}

	// 수신 티켓 내용 수정
	@RequestMapping("updateReceiver.do")
	@ResponseBody
	public void updateReceiver(int ticketNo, String addText, String userName, int progress) {
		
		Ticket ticket = new Ticket();
		ticket.setTicketNo(ticketNo);
		String updateText = service.ticketDetail(ticketNo).getTicketText();

		// 추가 text 내용을 log 형식으로 누적되게 출력
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
	
	// 수신자 티켓 삭제
	@RequestMapping("deleteReceiver.do")
	@ResponseBody
	public void deleteReceiver(TicketGroup ticketGroup) {
		service.deleteReceiver(ticketGroup);
	}

	// 발신 티켓 리스트
	// 페이징 적용 완료
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
		model.addAttribute("pageResult", new TicketPageResult(pageNo, service.sendTicketCount(member.getMemberNo()), ticketNum, pageNum));
	}
	
	// 발신 티켓 세부 사항 조회
	@RequestMapping("sendDetail.do")
	public void sendDetail(Model model, int ticketNo) {
		Ticket ticket = service.ticketDetail(ticketNo);
		List<String> receiverList = service.searchReceiver(ticketNo);
		
		
		model.addAttribute("ticket", ticket);
		model.addAttribute("ticketSkill", new Gson().toJson(service.ticketSkillDetail(ticketNo)));
		model.addAttribute("receiver", receiverList.toString().replace("[", "").replace("]", ""));
	}
	
	// 발신 티켓 내용 수정
	@RequestMapping("updateSender.do")
	@ResponseBody
	public void updateSender(Ticket ticket, int[] ticketSkill) {
		
		String addText = ticket.getTicketText();
		String updateText = service.ticketDetail(ticket.getTicketNo()).getTicketText();

		// 추가 text 내용을 log 형식으로 누적되게 출력
		if (addText != "") {
			updateText += ("&#10;" 
						+ "------------------------------------------------------------"
						+ "&#10;" 
						+ "[" + service.searchMemberByNo(ticket.getTicketSender()).getMemberName() + "]&#10;"
						+ addText);
		}
		ticket.setTicketText(updateText);
		
		service.updateSender(ticket);
		
		// 수신 티켓 내용 수정과 달리, Skill 수정이 필요하여 기존 skill 내용과 신규 skill 내용을 비교하여 삭제 및 입력 진행
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
	
	// 발신자 티켓 삭제
	@RequestMapping("deleteSender.do")
	@ResponseBody
	public void delteSender(int ticketNo) {
		service.deleteTicket(ticketNo);
	}
}
