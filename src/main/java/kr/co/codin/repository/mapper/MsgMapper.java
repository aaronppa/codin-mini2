package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.MsgPaging;
import kr.co.codin.repository.domain.Recipient;

public interface MsgMapper {

	void insertFirstMsg(Message msg);

	List<MemberAndId> selectMembers();

	List<Member> selectMembers2();

	void insertRecipients(Recipient recipient);

	void readTimeStamp(Recipient recipient);

	Message selectAMsg(int msgId);
	
	// 받은 메세지만 Trash 처리 (recipient table에서만 update)
	void updateRecipientTrash(Recipient recipient);
	
	// Sent/Draft Message Trash 처리 (message table에서만 update)
	void updateWriterTrash(MsgPaging mp);
	
	// 받은 메세지만 Restore 처리 (recipient table에서만 update)
	void updateRecipientRestore(Recipient recipient);
	
	// Sent/Draft Message Restore 처리 (message table에서만 update)
	void updateWriterRestore(MsgPaging mp);

	int insertThread(Message msg);
	
	List<Message> selectMsg(MsgPaging mp);

	List<Message> selectTrash(MsgPaging mp);
	
	List<Message> selectSentMsg(int memberNo);

	List<Message> selectDraftMsg(MsgPaging mp);

	void updateThread(Message msg);

	void insertReplyMsg(Message msg);


}
