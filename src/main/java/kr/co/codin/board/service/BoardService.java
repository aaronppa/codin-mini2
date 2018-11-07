package kr.co.codin.board.service;

import java.util.List;

import kr.co.codin.repository.domain.Board;
import kr.co.codin.repository.domain.BoardComment;
import kr.co.codin.repository.domain.BoardPage;

public interface BoardService {
	List<Board> listBoard(int PageNo);
	void write(Board board);
	Board detail(int boardNo);
	
	void CommentWrite(BoardComment comment);
	List<BoardComment> SelectComment(int boardNo);
	
	void deleteContent(Board board);
	void updateContent(Board board);
	List<Integer> AllList();
	//int MaxPageNo();
	int checkingContentCnt();
}
