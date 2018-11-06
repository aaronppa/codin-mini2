package kr.co.codin.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Board;
import kr.co.codin.repository.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Board> listBoard() {
		// TODO Auto-generated method stub
		return mapper.selectBoard();
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
		mapper.selectBoardByNo(boardNo);
		return mapper.selectBoardByNo(boardNo);
	}

	
	
}
