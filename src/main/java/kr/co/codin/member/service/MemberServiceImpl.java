package kr.co.codin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberSkill;
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

	@Override
	public Member login(Member member) {
		return mapper.selectMemberById(member);
	}

	@Override
	public void editProfile(Member member, MemberSkill memberSkill) {
		mapper.updateMember(member);
		mapper.deleteMemberSkill();
//		System.out.println(memberSkill.getMemberSkillNoList());
		if (memberSkill.getMemberSkillNoList() != null) {
			for(int memberSkillNo:memberSkill.getMemberSkillNoList()) {
				MemberSkill ms = new MemberSkill();
				ms.setMemberNo(memberSkill.getMemberNo());
				ms.setMemberSkillNo(memberSkillNo);
				mapper.insertMemberSkill(ms);
			};
		};
	}

	@Override
	public Member mypage(int memberNo) {
		return mapper.selectMemberByNo(memberNo);
	}

	@Override
	public List<MemberSkill> myskill(int memberNo) {
		return mapper.selectMemberSkillByNo(memberNo);
	}

	@Override
	public Member memberInfo(int memberNo) {
		return mapper.selectMemberByNo(memberNo);
	}

}
