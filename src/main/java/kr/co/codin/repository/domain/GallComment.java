package kr.co.codin.repository.domain;

import java.util.Date;

public class GallComment {

	private int gallNo;
	private int gallComNo;
	private String gallComWriter;
	private String gallComContent;
	private Date gallComRegDate;
	
	public int getGallNo() {
		return gallNo;
	}
	public void setGallNo(int gallNo) {
		this.gallNo = gallNo;
	}
	public int getGallComNo() {
		return gallComNo;
	}
	public void setGallComNo(int gallComNo) {
		this.gallComNo = gallComNo;
	}
	public String getGallComWriter() {
		return gallComWriter;
	}
	public void setGallComWriter(String gallComWriter) {
		this.gallComWriter = gallComWriter;
	}
	public String getGallComContent() {
		return gallComContent;
	}
	public void setGallComContent(String gallComContent) {
		this.gallComContent = gallComContent;
	}
	public Date getGallComRegDate() {
		return gallComRegDate;
	}
	public void setGallComRegDate(Date gallComRegDate) {
		this.gallComRegDate = gallComRegDate;
	}
	
	
	
}
