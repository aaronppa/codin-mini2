package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Board;
import kr.co.codin.repository.domain.BoardComment;

public interface BoardMapper {
	List<Board> selectBoard(int boardNo);
	void insertBoard(Board board);
	Board selectBoardByNo(int no);
	int updateViewCnt(int no);
	

	void DeleteBoard(Board board);
	void updateBoard(Board board);
	
	//댓글
	List<BoardComment> selectComment(int boardNo);
	//댓글 추가
	void insertComment(BoardComment comment);
	
	
	//페이징
	
	//총 게시물 수
	List<Integer> AllListCnt();
	int MaxBoardNo();
	int checkingContentCnt();
}
