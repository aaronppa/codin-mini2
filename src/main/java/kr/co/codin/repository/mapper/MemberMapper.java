package kr.co.codin.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberSkill;

public interface MemberMapper {
	List<Member> selectMember();
	void insertMember(Member member);
	Member selectMemberById(Member member);
	Member selectMemberByNo(int memberNo);
	List<MemberSkill> selectMemberSkillByNo(int memberNo);
	void updateMember(Member member);
	void deleteMemberSkill();
	void insertMemberSkill(MemberSkill memberSkill);
	void insertMemberSkill(int memberNo, int memberSkillNo);
}
