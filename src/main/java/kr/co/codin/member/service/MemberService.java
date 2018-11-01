package kr.co.codin.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;

/**
 * 회원 처리에 대한 비즈니스 로직 처리
 * @author kay
 *
 */
@Service
public interface MemberService {
	/**
	 * 회원 가입에 대한 비즈니스 로직 처리
	 * @param Member 객체
	 */
	void signup(Member member);
	
	/**
	 * 회원 목록에 대한 비즈니스 로직 처리
	 * @return List<Member>
	 */
	List<Member> list();
	
	/**
	 * 로그인에 대한 비즈니스 로직 처리
	 * @param Member 객체
	 * @return Member 객체
	 */
	Member login(Member member);
}
