package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Member;

public interface MemberMapper {
	List<Member> selectMember();
}
