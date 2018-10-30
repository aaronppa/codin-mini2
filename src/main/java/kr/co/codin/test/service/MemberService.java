package kr.co.codin.test.service;

import java.util.List;

import kr.co.codin.repository.domain.Member;

public interface MemberService {
	/**
	 * 멤버 일괄 검색
	 * @return
	 */
	List<Member> selectMember();
}
