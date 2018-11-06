package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
import kr.co.codin.repository.domain.Recipient;

public interface MsgMapper {

	void insertFirstMsg(Message msg);

	List<MemberAndId> selectMembers();

	List<Member> selectMembers2();

	void insertRecipients(Recipient recipient);

	List<Message> selectAllMsg(int memberNo);
}
