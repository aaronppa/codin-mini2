package kr.co.codin.msg.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.Recipient;


public interface MsgService {

	void writeFirstMsg(Message msg);

	List<MemberAndId> searchMember();

	List<Member> searchMember2();

	void addRecipients(Recipient recipients);

	List<Message> listAllMsg(int memberNo);

}
