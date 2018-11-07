package kr.co.codin.repository.domain;

public class MemberSearch {
	private Character memberGrade;
	private String memberId;
	
	
	public Character getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(Character memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "MemberSearch [memberGrade=" + memberGrade + ", memberId=" + memberId + "]";
	}
	
}
