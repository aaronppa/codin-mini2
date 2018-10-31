package kr.co.codin.repository.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Message {
	private int msgId;
	private int typeId;
	private String type;
	private String fromUserNo;
	private List<String> toUserNo;
	private String subject;
	private	String body;
	private Date dateSent;
	private int thread;
}
