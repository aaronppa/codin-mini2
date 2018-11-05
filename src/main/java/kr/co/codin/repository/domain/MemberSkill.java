package kr.co.codin.repository.domain;

import java.util.List;

public class MemberSkill {
	private List<Integer> memberSkillNoList;
	private int memberSkillNo;
	private int memberNo;
	private int skillCode;
	
	

	public List<Integer> getMemberSkillNoList() {
		return memberSkillNoList;
	}
	public void setMemberSkillNoList(List<Integer> memberSkillNoList) {
		this.memberSkillNoList = memberSkillNoList;
	}
	public int getMemberSkillNo() {
		return memberSkillNo;
	}
	public void setMemberSkillNo(int memberSkillNo) {
		this.memberSkillNo = memberSkillNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getSkillCode() {
		return skillCode;
	}
	public void setSkillCode(int skillCode) {
		this.skillCode = skillCode;
	}
	@Override
	public String toString() {
		return "MemberSkill [memberSkillNoList=" + memberSkillNoList + ", memberSkillNo=" + memberSkillNo
				+ ", memberNo=" + memberNo + ", skillCode=" + skillCode + "]";
	}
	

}
