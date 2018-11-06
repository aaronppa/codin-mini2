package kr.co.codin.repository.domain;

import java.util.Date;

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
}
