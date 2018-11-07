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
}
