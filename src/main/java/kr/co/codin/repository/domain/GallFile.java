package kr.co.codin.repository.domain;

import java.util.List;


public class GallFile {
	private int gallNo;
	private int fileNo;
	private String fileOriName;
	private String fileServerName;
	private String filePath;
	private int fileSize;
	
	public int getGallNo() {
		return gallNo;
	}
	public void setGallNo(int gallNo) {
		this.gallNo = gallNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public String getFileServerName() {
		return fileServerName;
	}
	public void setFileServerName(String fileServerName) {
		this.fileServerName = fileServerName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	
}
