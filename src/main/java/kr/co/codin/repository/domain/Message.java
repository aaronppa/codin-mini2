package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Message {
	private int msgId;
	private int typeId;
	private String fromUserNo;
	private String fromUserId;
	private String fromUserName;
	private String subject;
	private	String body;
	private Date dateSent;
	private int thread;
	private int trashWriter;
	private Date dateRead;
	private int trashRecipient;
	private String type;
	private List<Recipient> recipients;
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getFromUserNo() {
		return fromUserNo;
	}
	public void setFromUserNo(String fromUserNo) {
		this.fromUserNo = fromUserNo;
	}
	public String getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getDateSent() {
		return dateSent;
	}
	public void setDateSent(Date dateSent) {
		this.dateSent = dateSent;
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public int getTrashWriter() {
		return trashWriter;
	}
	public void setTrashWriter(int trashWriter) {
		this.trashWriter = trashWriter;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<Recipient> getRecipients() {
		return recipients;
	}
	public void setRecipients(List<Recipient> recipients) {
		this.recipients = recipients;
	}
	
	
}
