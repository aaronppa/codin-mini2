package kr.co.codin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberCareer;
import kr.co.codin.repository.domain.MemberSearch;
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
	public void editProfile(Member member, MemberSkill memberSkill, MemberCareer memberCareer) {
		mapper.updateMember(member);
		mapper.deleteMemberSkill();
//		System.out.println("service : " + memberSkill.getMemberSkillNoList());
//		System.out.println(memberSkill.getMemberSkillNoList());
		if (memberSkill.getMemberSkillNoList() != null) {
			for(int memberSkillNo:memberSkill.getMemberSkillNoList()) {
				MemberSkill ms = new MemberSkill();
				ms.setMemberNo(memberSkill.getMemberNo());
				ms.setMemberSkillNo(memberSkillNo);
				mapper.insertMemberSkill(ms);
			};
		};
		mapper.updateMemberCareer(memberCareer);
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

	@Override
	public void editGrade(Member member) {
		mapper.updateGrade(member);
	}

	@Override
	public List<MemberCareer> mycareer(int memberNo) {
		return mapper.selectMemberCareerByNo(memberNo);
	}

	@Override
	public void addCareer(MemberCareer memberCareer) {
		mapper.insertMemberCareer(memberCareer);
	}

	@Override
	public void deleteCareerAll(int memberNo) {
		mapper.deleteCareerAll(memberNo);
	}

	@Override
	public void deleteCareer(MemberCareer memberCareer) {
		mapper.deleteCareer(memberCareer);
	}

	@Override
	public void deleteAccount(int memberNo) {
		mapper.deleteAccount(memberNo);
	}

	@Override
	public List<Member> searchMember(MemberSearch memberSearch) {
//		System.out.println(memberSearch);
		return mapper.searchMember(memberSearch);
	}

}
