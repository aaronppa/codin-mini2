package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Board;

public interface BoardMapper {
	List<Board> selectBoard();
	void insertBoard(Board board);
	Board selectBoardByNo(int no);
	int updateViewCnt(int no);
}
