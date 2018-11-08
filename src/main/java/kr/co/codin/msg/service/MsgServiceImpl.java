package kr.co.codin.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.MsgPaging;
import kr.co.codin.repository.domain.Recipient;
import kr.co.codin.repository.mapper.MsgMapper;

@Service
public class MsgServiceImpl implements MsgService{

	@Autowired
	MsgMapper mapper;

	@Override
	public void writeFirstMsg(Message msg) {
		mapper.insertFirstMsg(msg);
	}

	@Override
	public List<MemberAndId> searchMember() {
		return mapper.selectMembers();
	}

	@Override
	public List<Member> searchMember2() {
		return mapper.selectMembers2();
	}

	@Override
	public void addRecipients(Recipient recipient) {
		mapper.insertRecipients(recipient);
	}

	@Override
	public void updateread(Recipient recipient) {
		mapper.readTimeStamp(recipient);
	}

	@Override
	public Message detail(int msgId) {
		Message message = mapper.selectAMsg(msgId);
//		System.out.println("mapper.selectAMsg(msgId) RESULT: "+message.toString());
		return message;
	}
	
	@Override
	public void trashReceivedMsg(Recipient recipient) {
		mapper.updateRecipientTrash(recipient);
	}
	
	@Override
	public void trashDraftSentMsg(MsgPaging mp) {
		mapper.updateWriterTrash(mp);
	}
	
	@Override
	public void restoreReceivedMsg(Recipient recipient) {
		mapper.updateRecipientRestore(recipient);
	}
	
	@Override
	public void createThread(Message msg) {
		mapper.insertThread(msg);
	}
	
	@Override
	public void restoreDraftSentMsg(MsgPaging mp) {
		mapper.updateWriterRestore(mp);
	}
	
	@Override
	public List<Message> listMsg(MsgPaging mp) {
		return mapper.selectMsg(mp);
	}
	
	@Override
	public List<Message> listTrashMsg(MsgPaging mp) {
		return mapper.selectTrash(mp);
	}
	
	@Override
	public List<Message> listSentMsg(int memberNo) {
		return mapper.selectSentMsg(memberNo);
	}

	@Override
	public List<Message> listDraftMsg(MsgPaging mp) {
		return mapper.selectDraftMsg(mp);
	}

	@Override
	public void updateNewThread(Message msg) {
		mapper.updateThread(msg);
		
	}

	@Override
	public void writeReplyMsg(Message msg) {
		mapper.insertReplyMsg(msg);
	}


	

	

}
