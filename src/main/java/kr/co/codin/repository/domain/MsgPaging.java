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
	}