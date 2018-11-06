package kr.co.codin.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.Recipient;
import kr.co.codin.repository.mapper.MsgMapper;

@Controller
@RequestMapping("msg")
public class MsgController {
		
	@Autowired
	private MsgService service;
	
	@Autowired
	MsgMapper mapper;

	@RequestMapping("maininbox.do")
	public void mainmsg() {
		
	}
	
	
	@RequestMapping("displayallmsg.do")
	@ResponseBody
	public List<Message> listAllMsg(int memberNo) throws Exception{
		List<Message> msgs = service.listAllMsg(memberNo);
		System.out.println(msgs.toString());
		return msgs;
	}
	
	@RequestMapping("write.do")
	public String writeFirstMsg(Message msg, @RequestParam(value="toUserNo") List<Integer> recipients) throws Exception{
		System.out.println(msg.toString());
		System.out.println(recipients);
		if(msg.getBody().isEmpty()) {
			msg.setTypeId(1);
		} else {
			msg.setTypeId(2);
		}
		System.out.println(msg.toString());
		service.writeFirstMsg(msg);
		int msgId = msg.getMsgId();
		System.out.println(msgId);
		for(int id:recipients) {			
			Recipient recipient = new Recipient();
			recipient.setToUserNo(id);
			recipient.setMsgId(msg.getMsgId());
			System.out.println(recipient.toString());
			service.addRecipients(recipient);
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "maininbox.do";
	}
	
	@RequestMapping("searchmember.do")
	@ResponseBody
	public List<MemberAndId> searchMember() throws Exception{
		List<MemberAndId> list = service.searchMember();
		for(MemberAndId m:list) {
			m.setMemberNameAndId(m.getMemberName()+"-"+m.getMemberId());
		}
		return list;
	}
	
	@RequestMapping("searchmember2.do")
	@ResponseBody
	public Map<String, Member> searchMember2() throws Exception{
		List<Member> list = service.searchMember2();
		Map<String, Member> mapList = new HashMap<String, Member>();
		for(Member m : list) {
			mapList.put(m.getMemberName()+"-"+m.getMemberId(), m);
		}
		System.out.println(mapList.toString());
		return mapList;
	}
}
