package kr.co.codin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Board;
import kr.co.codin.repository.domain.BoardComment;
import kr.co.codin.repository.domain.BoardPage;
import kr.co.codin.repository.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Board> listBoard(int PageNo) {
		System.out.println("serviceImpl의 PageNo"+PageNo);
		System.out.println(PageNo);
		// TODO Auto-generated method stub
		System.out.println("맥스 모스NO:"+mapper.MaxBoardNo());
		return mapper.selectBoard((PageNo-1)*20);
	}

	@Override
	public void write(Board board) {
		mapper.insertBoard(board);
		System.out.println(board.getBoardTitle());
		System.out.println(board.getBoardId());
		System.out.println(board.getBoardContent());
		String ddd=board.getBoardContent();
		
	}

	@Override
	public Board detail(int boardNo) {
		mapper.updateViewCnt(boardNo);
		
		return mapper.selectBoardByNo(boardNo);
	}

	@Override
	public void CommentWrite(BoardComment comment) {
		System.out.println("서비스 접근완료");
		System.out.println(comment.getCommentContent());
		System.out.println(comment.getCommentId());
		System.out.println(comment.getBoardNo());
		mapper.insertComment(comment);
	}

	@Override
	public List<BoardComment> SelectComment(int boardNo) {
		
		return mapper.selectComment(boardNo);
	}

	@Override
	public void deleteContent(Board Board) {
//		System.out.println(boardNo);
		mapper.DeleteBoard(Board);
		
	}

	@Override
	public void updateContent(Board board) {
		System.out.println(board.getBoardContent());
		System.out.println(board.getBoardNo());
		System.out.println(board.getBoardWriter());
		// TODO Auto-generated method stub
		 mapper.updateBoard(board);
		
	
	}

	@Override
	public List<Integer> AllList() {
		return mapper.AllListCnt();
		
	}

	@Override
	public int checkingContentCnt() {
		// TODO Auto-generated method stub
		return mapper.checkingContentCnt();
	}

	
	
//	@Override
//	public int MaxPageNo() {//마지막 페이지
//	if(mapper.AllListCnt()%20 ==0) {
//			
//			System.out.println("첫번째if 걸림");
//
//			return (int)Math.floor(mapper.AllListCnt()/2);//라스트 페이지
//		}else {
//
//			System.out.println(new BoardPage().getEndPage());
//
//			System.out.println("else걸림");
//
//			System.out.println("endPage"+new BoardPage().getEndPage());
//			return (int)Math.floor(mapper.AllListCnt()/20+1);
//		}
//		
//	}

	
	
	
}
