package kr.co.codin.msg.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.MsgPaging;
import kr.co.codin.repository.domain.Recipient;


public interface MsgService {

	void writeFirstMsg(Message msg);

	List<MemberAndId> searchMember();

	List<Member> searchMember2();

	void addRecipients(Recipient recipients);

	void updateread(Recipient recipient);

	Message detail(int msgId);

	void trashReceivedMsg(Recipient recipient);

	void trashDraftSentMsg(MsgPaging mp);
	
	void restoreReceivedMsg(Recipient recipient);
	
	void restoreDraftSentMsg(MsgPaging mp);

	List<Message> listMsg(MsgPaging mp);
	
	List<Message> listTrashMsg(MsgPaging mp);
	
	List<Message> listSentMsg(int memberNo);

	List<Message> listDraftMsg(MsgPaging mp);
}
