package kr.co.codin.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberSkill;

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
	
	/**
	 * 마이페이지의 비즈니스 로직 처리
	 * @param memberNo
	 * @return Member 객체
	 */
	Member mypage(int memberNo);
	
	/**
	 * 내 스킬 조회의 비즈니스 로직 처리
	 * @param memberNo
	 * @return MemberSkill 객체
	 */
	List<MemberSkill> myskill(int memberNo);
	
	/**
	 * 회원 정보 수정 (본인)에 대한 비즈니스 로직 처리
	 * @param member
	 */
	void editProfile(Member member, MemberSkill memberSkill);
	
	/**
	 * 관리자의 회원 정보 조회에 관한 비즈니스 로직 처리
	 * @param memberNo
	 * @return Member 객체
	 */
	Member memberInfo(int memberNo);
}
