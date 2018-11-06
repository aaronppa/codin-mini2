package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberCareer {
	private int careerNo;
	private int memberNo;
	private String careerCompany;
	private String careerPosition;
	private String careerDepartment;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date careerStart;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date careerEnd;
	
	private String careerJob;
	
	
	public int getCareerNo() {
		return careerNo;
	}
	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getCareerCompany() {
		return careerCompany;
	}
	public void setCareerCompany(String careerCompany) {
		this.careerCompany = careerCompany;
	}
	public String getCareerPosition() {
		return careerPosition;
	}
	public void setCareerPosition(String careerPosition) {
		this.careerPosition = careerPosition;
	}
	public String getCareerDepartment() {
		return careerDepartment;
	}
	public void setCareerDepartment(String careerDepartment) {
		this.careerDepartment = careerDepartment;
	}
	public Date getCareerStart() {
		return careerStart;
	}
	public void setCareerStart(Date careerStart) {
		this.careerStart = careerStart;
	}
	public Date getCareerEnd() {
		return careerEnd;
	}
	public void setCareerEnd(Date careerEnd) {
		this.careerEnd = careerEnd;
	}
	public String getCareerJob() {
		return careerJob;
	}
	public void setCareerJob(String careerJob) {
		this.careerJob = careerJob;
	}
	
	@Override
	public String toString() {
		return "MemberCareer [careerNo=" + careerNo + ", memberNo=" + memberNo + ", careerCompany=" + careerCompany
				+ ", careerPosition=" + careerPosition + ", careerDepartment=" + careerDepartment + ", careerStart="
				+ careerStart + ", careerEnd=" + careerEnd + ", careerJob=" + careerJob + "]";
	}
}
