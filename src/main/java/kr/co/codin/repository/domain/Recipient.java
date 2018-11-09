package kr.co.codin.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Recipient {
	private int msgId;
	private int toUserNo;
	private Date dateRead;
	private int trashRecipient;
	private String toUserId;
	private String toUserName;
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getToUserNo() {
		return toUserNo;
	}
	public void setToUserNo(int toUserNo) {
		this.toUserNo = toUserNo;
	}
	public Date getDateRead() {
		return dateRead;
	}
	public void setDateRead(Date dateRead) {
		this.dateRead = dateRead;
	}
	public int getTrashRecipient() {
		return trashRecipient;
	}
	public void setTrashRecipient(int trashRecipient) {
		this.trashRecipient = trashRecipient;
	}
	public String getToUserId() {
		return toUserId;
	}
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
}
