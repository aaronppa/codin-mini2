package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberName;
	private String memberGrade;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memberRegDate;
	
	private int memberAge;
	private String memberGender;
	
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
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberEmail=" + memberEmail + ", memberName=" + memberName + ", memberGrade=" + memberGrade
				+ ", memberRegDate=" + memberRegDate + ", memberAge=" + memberAge + ", memberGender=" + memberGender
				+ "]";
	}
	
}
