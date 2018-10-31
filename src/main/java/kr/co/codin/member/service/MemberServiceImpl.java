package kr.co.codin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void signup(Member member) {
		mapper.insertMember(member);
	}

	@Override
	public List<Member> list() {
		return mapper.selectMember();
	}

}
