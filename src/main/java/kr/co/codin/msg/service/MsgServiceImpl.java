package kr.co.codin.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberAndId;
import kr.co.codin.repository.domain.Message;
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
	public List<Message> listAllMsg(int memberNo) {
		return mapper.selectAllMsg(memberNo);
	}

}
