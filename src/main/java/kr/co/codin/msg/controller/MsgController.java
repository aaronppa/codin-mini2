package kr.co.codin.msg.controller;

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
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.MsgPaging;
import kr.co.codin.repository.domain.Recipient;
import kr.co.codin.repository.mapper.MsgMapper;

/*
 * 모든 Controller에서 session을 통해서 조회
 */
@Controller
@RequestMapping("msg")
public class MsgController {
		
	@Autowired
	private MsgService service;
	
	@Autowired
	private MsgMapper mapper;
	
	
	@RequestMapping("maininbox.do")
	public void mainmsg() {
		;;
	}
	@RequestMapping("mailinbox.do")
	public void mailmsg() {
		;;
	}
	@RequestMapping("memoinbox.do")
	public void memomsg() {
		;;
	}
	@RequestMapping("announcementinbox.do")
	public void announcementmsg() {
		;;
	}
	@RequestMapping("draftinbox.do")
	public void draftmsg() {
		;;
	}
	@RequestMapping("sentbox.do")
	public void sentmsg() {
		;;
	}
	@RequestMapping("trashbox.do")
	public void trashmsg() {
		;;
	}
		
	@RequestMapping("displaymsg.do")
	@ResponseBody
	public List<Message> listMsg(int typeId, HttpSession session) throws Exception{
		System.out.println("displaymsg.do -> TYPEID: "+typeId);
		Member member = (Member) session.getAttribute("user");
		MsgPaging mp = new MsgPaging();
		mp.setTypeId(typeId);
		mp.setToUserNo(member.getMemberNo());
		List<Message> msgs = service.listMsg(mp);
		
		System.out.println("displaymsg.do -> "+msgs.toString());
		return msgs;
	}
	
	@RequestMapping("displaydraftsentmsg.do")
	@ResponseBody
	public List<Message> listDraftSentMsg(int typeId, HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		System.out.println("displaysentmsg.do -> fromUserNo: "+member.getMemberNo());
		List<Message> msgs;
		if(typeId==1) {
			msgs = service.listSentMsg(member.getMemberNo());
		} else {
			MsgPaging mp = new MsgPaging();
			mp.setTypeId(typeId);
			mp.setFromUserNo(member.getMemberNo());
			msgs = service.listDraftMsg(mp);
		}
		System.out.println("displaysentmsg.do -> "+msgs.toString());
		return msgs;
	}
	
	@RequestMapping("displaytrashmsg.do")
	@ResponseBody
	public List<Message> listTrashMsg(HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		System.out.println("displaytrashmsg.do -> UserNo: "+member.getMemberNo());
		MsgPaging mp = new MsgPaging();
		mp.setFromUserNo(member.getMemberNo());
		System.out.println("displaytrashmsg.do -> MsgPaging UserNo: "+mp.getFromUserNo());
		List<Message> msgs = service.listTrashMsg(mp);
		System.out.println("displaytrashmsg.do -> "+msgs.toString());
		return msgs;
	}
	
	@RequestMapping("write.do")
	public String writeFirstMsg(Message msg, @RequestParam(value="toUserNo") List<Integer> recipients) throws Exception{
		System.out.println("write.do -> INITIAL MESSAGE: "+msg.toString());
		System.out.println("write.do -> RECIPIENTS: "+recipients);
		if(msg.getBody().isEmpty()) {
			msg.setTypeId(1);
		} else {
			msg.setTypeId(2);
		}
		System.out.println("write.do -> CHANGED TYPE MESSAGE: "+msg.toString());
		service.writeFirstMsg(msg);
		int msgId = msg.getMsgId();
		System.out.println("write.do -> MSGID: "+msgId);
		for(int id:recipients) {			
			Recipient recipient = new Recipient();
			recipient.setToUserNo(id);
			recipient.setMsgId(msg.getMsgId());
			System.out.println("write.do addRecipients() -> RECIPIENT: "+recipient.toString());
			service.addRecipients(recipient);
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "maininbox.do";
	}

	// ReplyAll Get All Recipients
	@RequestMapping("premailreply.do")
	@ResponseBody
	public Message mailReplyAll(int msgId, HttpSession session) throws Exception{
	
		Message msg = service.detail(msgId);
		System.out.println(msg.toString());
		return msg;
	}
	
	@RequestMapping("mailreply.do")
	public String writeReplyMsg(Message msg, @RequestParam(value="toUserNo") List<Integer> recipients) throws Exception{
		System.out.println("mailreply.do.do -> INCOMING MESSAGE PARAM: "+msg.toString());
		if(msg.getThread()==0) {
			service.createThread(msg);			
			service.updateNewThread(msg);
		} 
			msg.setMsgId(0);
			service.writeReplyMsg(msg);
			System.out.println("new fetched msgId from generatedKEY: "+msg.getMsgId());
		for(int id:recipients) {			
			Recipient recipient = new Recipient();
			recipient.setToUserNo(id);
			recipient.setMsgId(msg.getMsgId());
			System.out.println("write.do addRecipients() -> RECIPIENT: "+recipient.toString());
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
	
//	NOT USING
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
	
	@RequestMapping("updateread.do")
	@ResponseBody
	public void updateread(int msgId, HttpSession session) throws Exception{
		Recipient recipient = new Recipient();
		Member member = (Member) session.getAttribute("user");
		recipient.setMsgId(msgId);
		recipient.setToUserNo(member.getMemberNo());
		System.out.println("updateread.do -> "+recipient.toString());
		service.updateread(recipient);
	}
	
	@RequestMapping("msgitemdetail.do")
	@ResponseBody
	public Message detail(int msgId, HttpSession session, Model model) throws Exception{
		Recipient recipient = new Recipient();
		Member member = (Member) session.getAttribute("user");
		System.out.println("==msgitemdetail.do(parameter Test)-> "+member.toString());
		
		if(member==null) {
				return null;
		}
		
		recipient.setMsgId(msgId);
		recipient.setToUserNo(member.getMemberNo());
		service.updateread(recipient);
		Message msg = service.detail(msgId);
		System.out.println(msg.toString());
		return msg;
	}
		
	// 받은 메세지만 Trash 처리 (recipient table에서만 update)
	@RequestMapping("trashreceivedmsg.do")
	@ResponseBody
	public void trashReceivedMsg(int[] msgId , HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		for(int m:msgId) {
			Recipient recipient = new Recipient();
			recipient.setMsgId(m);
			recipient.setToUserNo(member.getMemberNo());
			service.trashReceivedMsg(recipient);
		}
	}
	
	
	// Sent/Draft Message Trash 처리 (message table에서만 update)
	@RequestMapping("trashdraftsentmsg.do")
	@ResponseBody
	public void trashDraftSentMsg(int[] msgId , HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		for(int m:msgId) {
			MsgPaging mp = new MsgPaging();
			mp.setMsgId(m);
			mp.setFromUserNo(member.getMemberNo());
			service.trashDraftSentMsg(mp);
		}
	}
	
	// 받은 메세지만 Restore 처리 (recipient table에서만 update)
	@RequestMapping("restorereceivedmsg.do")
	@ResponseBody
	public void restoreReceivedMsg(int[] msgId , HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		for(int m:msgId) {
			Recipient recipient = new Recipient();
			recipient.setMsgId(m);
			recipient.setToUserNo(member.getMemberNo());
			service.restoreReceivedMsg(recipient);
		}
	}
	
	// Sent/Draft Message Restore 처리 (message table에서만 update)
	@RequestMapping("restoredraftsentmsg.do")
	@ResponseBody
	public void restoreDraftSentMsg(int[] msgId , HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("user");
		for(int m:msgId) {
			MsgPaging mp = new MsgPaging();
			mp.setMsgId(m);
			mp.setFromUserNo(member.getMemberNo());
			service.restoreDraftSentMsg(mp);
		}
	}
}
