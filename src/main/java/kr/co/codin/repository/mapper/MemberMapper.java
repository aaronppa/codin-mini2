package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberCareer;
import kr.co.codin.repository.domain.MemberSearch;
import kr.co.codin.repository.domain.MemberSkill;

public interface MemberMapper {
	List<Member> selectMember();
	void insertMember(Member member);
	Member selectMemberById(Member member);
	Member selectMemberByNo(int memberNo);
	List<MemberSkill> selectMemberSkillByNo(int memberNo);
	void updateMember(Member member);
	void updateGrade(Member member);
	void deleteMemberSkill();
	void insertMemberSkill(MemberSkill memberSkill);
	void insertMemberSkill(int memberNo, int memberSkillNo);
	List<MemberCareer> selectMemberCareerByNo(int memberNo);
	void insertMemberCareer(MemberCareer memberCareer);
	void updateMemberCareer(MemberCareer memberCareer);
	void deleteCareerAll(int memberNo);
	void deleteCareer(MemberCareer memberCareer);
	void deleteAccount(int memberNo);
	List<Member> searchMember(MemberSearch memberSearch);
	Member selectId(String memberId);
}
