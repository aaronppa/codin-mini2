package kr.co.codin.repository.domain;

import java.util.Date;

public class Gallary {
	private int gallNo;
	private String gallWriter;
	private String gallTitle;
	private String gallContent;
	private Date gellRegDate;
	private int gallViewCnt;
	
	public int getGallNo() {
		return gallNo;
	}
	public void setGallNo(int gallNo) {
		this.gallNo = gallNo;
	}
	public String getGallWriter() {
		return gallWriter;
	}
	public void setGallWriter(String gallWriter) {
		this.gallWriter = gallWriter;
	}
	public String getGallTitle() {
		return gallTitle;
	}
	public void setGallTitle(String gallTitle) {
		this.gallTitle = gallTitle;
	}
	public String getGallContent() {
		return gallContent;
	}
	public void setGallContent(String gallContent) {
		this.gallContent = gallContent;
	}
	public Date getGellRegDate() {
		return gellRegDate;
	}
	public void setGellRegDate(Date gellRegDate) {
		this.gellRegDate = gellRegDate;
	}
	public int getGallViewCnt() {
		return gallViewCnt;
	}
	public void setGallViewCnt(int gallViewCnt) {
		this.gallViewCnt = gallViewCnt;
	}
	
}	
