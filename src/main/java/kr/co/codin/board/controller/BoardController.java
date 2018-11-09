package kr.co.codin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.board.service.BoardService;
import kr.co.codin.repository.domain.Board;
import kr.co.codin.repository.domain.BoardComment;
import kr.co.codin.repository.domain.BoardPage;



@Controller
@RequestMapping("board")
@SessionAttributes("member")
public class BoardController {
	
	
	@Autowired
	BoardService service;
	
	@RequestMapping("list.do")
	
	public void list(Model model,int pageNo,BoardPage boardpage) throws Exception{
		System.out.println("listForm의 PageNo:"+pageNo);
		
		//service.listBoard(pageNo);//여기서 터졌음
		
		//service.MaxPageNo();
		model.addAttribute("board",service.listBoard(pageNo));

		
		
		
	}
	
	
	
	@RequestMapping("detail.do")
	public void detail(Model model,int boardNo) throws Exception{
		
		System.out.println("detailForm.do 들어옴");
		model.addAttribute("board",service.detail(boardNo));
		
	
	}
	@RequestMapping("write.do")
	public String write(Board board) throws Exception{
		System.out.println("wirte.do 들어옴");
		service.write(board);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do?pageNo=1";
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
	
		System.out.println("writeForm.do 들어옴");
		
		model.addAttribute("member");
	}
	
	@RequestMapping("CommentForm.do")//댓글작성
	@ResponseBody
	public String CommentWrite(Model model,BoardComment comment,int boardNo) throws Exception{
		System.out.println("코멘트 접근완료");
		model.addAttribute("BoardComment");
		service.CommentWrite(comment);
		//return "http://localhost:8000/codin_mini/board/detailForm.do?boardNo=16"+boardNo;
		return "redirect:/board/detailForm.do?boardNo="+boardNo;
	}
	
	
	@RequestMapping("selectComment.do")//댓글
	@ResponseBody
	public List<BoardComment> SelectComment(BoardComment comment,Model model ,int boardNo) throws Exception{
	//	model.addAttribute("BoardComment",service.SelectComment(boardNo));
		System.out.println(boardNo);
		
		model.addAttribute("BoardCommentList");
		System.out.println("selectComment.do 접근완료");
		//System.out.println(comment.getCommentDate());
		//System.out.println(comment.getBoardNo());
		return service.SelectComment(boardNo);
	}
	
	@RequestMapping("ajaxPaingList.do")
	@ResponseBody
	public int PageList(Integer pageNo,String boardId){
		System.out.println(boardId);
		System.out.println("pageList에서 찍은 pageNo:"+pageNo);
		
	
		
		if(service.checkingContentCnt()%20 ==0) {

		return (int)Math.floor(service.checkingContentCnt()/20);//라스트 페이지
		//return  list;
		}else {
		
		return (int)Math.floor(service.checkingContentCnt()/20+1);
		//return list;
	}
	

		
	}
	
	@RequestMapping("ajaxPagingListForm.do")
	@ResponseBody
	public String PageListForm(Integer pageNo){
		System.out.println("ajax:"+pageNo);
		service.AllList();
		return "redirect:/board/listForm.do?pageNo="+pageNo;
	}
	
	@RequestMapping("deleteForm.do")
	public String deleteForm(Board board) throws Exception{
		System.out.println("딜리트 폼에 들어옴");
		
		service.deleteContent(board);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do?pageNo=1";
	}
	
	@RequestMapping("updateForm.do")
	public void UpdateForm(Model model, Board board) throws Exception{
		System.out.println("updateDate 접근");
		model.addAttribute("board");
		
	}
	
	@RequestMapping("update.do")
	public String update(Model model,Board board)throws Exception{
		System.out.println("update.do 접근");
		service.updateContent(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do?pageNo=1";
	}
	
}
