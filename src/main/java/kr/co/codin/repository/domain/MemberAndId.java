/*
 *  Message 기능에서 메세지 작성시 유효한 사용자 계정 검색을 
 *  이름+아이디 둘중에 하나로도 입력하면 조금더 쉽게 정보를 검색하고 결과를 받기 위해서
 *  memberNameAndId라는 필드변수를 추가해서 Test 해봄..
 *  결론: 잘됨... 
 */

package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberAndId {
	private int memberNo;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberName;
	private String memberGrade;
	private String memberNameAndId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memberRegDate;
	
	private int memberAge;
	private char memberGender;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	
	public Date getMemberRegDate() {
		return memberRegDate;
	}
	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	
	public String getMemberNameAndId() {
		return memberNameAndId;
	}
	public void setMemberNameAndId(String memberNameAndId) {
		this.memberNameAndId = memberNameAndId;
	}
	@Override
	public String toString() {
		return "MemberAndId [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberEmail=" + memberEmail + ", memberName=" + memberName + ", memberGrade=" + memberGrade
				+ ", memberNameAndId=" + memberNameAndId + ", memberRegDate=" + memberRegDate + ", memberAge="
				+ memberAge + ", memberGender=" + memberGender + "]";
	}
	
	
	
}
