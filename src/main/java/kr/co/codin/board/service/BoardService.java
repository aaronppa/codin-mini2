package kr.co.codin.board.service;

import java.util.List;

import kr.co.codin.repository.domain.Board;

public interface BoardService {
	List<Board> listBoard();
	void write(Board board);
	Board detail(int boardNo);
}
