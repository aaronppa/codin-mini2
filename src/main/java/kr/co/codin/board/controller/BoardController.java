package kr.co.codin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.board.service.BoardService;
import kr.co.codin.repository.domain.Board;

@Controller
@RequestMapping("board")
@SessionAttributes("member")
public class BoardController {
	
	
	@Autowired
	BoardService service;
	
	@RequestMapping("listForm.do")
	public void listForm(Model model) throws Exception{
		System.out.println("listForm.do 들어옴");
		service.listBoard();
		List<Board> Li= service.listBoard();;
		for(Board ll: Li) {
			System.out.println("제목:"+ll.getBoardTitle());
		}
		model.addAttribute("board",service.listBoard());
		
		
	}
	
	
	
	@RequestMapping("detailForm.do")
	public void detail(Model model,int boardNo) throws Exception{
		
		System.out.println("detailForm.do 들어옴");
		model.addAttribute("board",service.detail(boardNo));
		
	
	}
	@RequestMapping("write.do")
	public String write(Board board) throws Exception{
		System.out.println("wirte.do 들어옴");
		service.write(board);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"listForm.do";
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
	
		System.out.println("writeForm.do 들어옴");
		
		model.addAttribute("member");
	}
	
	
	
}
