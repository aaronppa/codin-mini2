package kr.co.codin.repository.domain;

import lombok.Data;

@Data
public class MsgPaging {
	// msg type
		private int msgId;
		private int typeId;
		private int toUserNo;
		private int fromUserNo;
		private int trashRecipient;
		private int trashWriter;
		
	// Page Number 
		private int pageNo;
		private int pageNum = 10;
		
		public MsgPaging() {
			;;
		}
		
		public MsgPaging(int pageNum) {
			this.pageNum = pageNum;
		}
		
		// getEnd(), getBegin() 에 수식으로 처리하여 xml mapper에 보낸다. 
//		private int begin;
//		private int end;

		public int getPageNo() {
			return pageNo;
		}
		
		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}
		
		// #{end} -> board.xml
		public int getEnd() {
			return pageNo * pageNum;
		}
		
		// #{begin} -> board.xml	
		public int getBegin() {
			return (pageNo - 1) * pageNum +1;
		}

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

		public int getToUserNo() {
			return toUserNo;
		}

		public void setToUserNo(int toUserNo) {
			this.toUserNo = toUserNo;
		}

		public int getFromUserNo() {
			return fromUserNo;
		}

		public void setFromUserNo(int fromUserNo) {
			this.fromUserNo = fromUserNo;
		}

		public int getTrashRecipient() {
			return trashRecipient;
		}

		public void setTrashRecipient(int trashRecipient) {
			this.trashRecipient = trashRecipient;
		}

		public int getTrashWriter() {
			return trashWriter;
		}

		public void setTrashWriter(int trashWriter) {
			this.trashWriter = trashWriter;
		}

		public int getPageNum() {
			return pageNum;
		}

		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}
		
		
	}