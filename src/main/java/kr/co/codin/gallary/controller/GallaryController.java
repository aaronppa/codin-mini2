package kr.co.codin.gallary.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.gallary.service.GallaryService;
import kr.co.codin.repository.domain.GallComment;
import kr.co.codin.repository.domain.GallFile;
import kr.co.codin.repository.domain.Gallary;
import kr.co.codin.test.service.TestService;

@Controller
//@RestController : 전체를 ajax 값으로 처리
@RequestMapping("gallary")
public class GallaryController {

	@Autowired
	private TestService tService;
	
	@Autowired
	private GallaryService service;
	
	@RequestMapping("list.do")
	public void list(Model model) throws Exception{
		System.out.println("list");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		model.addAttribute("gall", service.gallList());
	}
	
	//void값일때는 .do대신 .jsp를 붙이고 같은 이름의 jsp를 찾아가게 된다.
	@RequestMapping("detail.do")
	public void detail(int gallNo,Integer viewCnt, Model model) throws Exception{
		System.out.println("detail");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		model.addAttribute("gall", service.detailGall(gallNo));
//		model.addAttribute("gall", service.updateViewCnt(gallNo));
	}

	@RequestMapping("updateForm.do")
	public void updateForm(int gallNo,Model model) throws Exception{
		System.out.println("updateForm");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		model.addAttribute("gall", service.updateForm(gallNo));
	}
	@RequestMapping("update.do")
	public String update(Gallary gallary) throws Exception{
		System.out.println("update");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.updateGall(gallary);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	@RequestMapping("writeForm.do")
	public void writeForm(Model model) throws Exception{
		System.out.println("writeForm");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		model.addAttribute("gall");
	}
	@RequestMapping("write.do")
	public String write(Gallary gallary) throws Exception{
		System.out.println("write");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.writeGall(gallary);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	@RequestMapping("delete.do")
	public String delete(int gallNo, Model model) throws Exception{
		System.out.println("delete");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.deleteGall(gallNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}

	@RequestMapping("insertCom.do")
	public void insertCom(GallComment gallComment, int gallNo) throws Exception{
		System.out.println("insertComment");
		System.out.println(gallNo);
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.insertGallComment(gallComment);
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do";
//		return "redirect:/gallary/detail.do=?gallNo="+gallNo;
	}
	
	@RequestMapping("comList.do")
	//문자열로 반환하게 해준다. ajax방식에서 사용
	@ResponseBody
	public List<GallComment> gallComList(int gallNo) throws Exception{
		System.out.println("comList");
		System.out.println(gallNo);
		System.out.println("아이디 :"+tService.login1().getMemberId());
		return service.selectCommentList(gallNo);
	}
		
	@RequestMapping("uploadFile.do")
	public void uploadFile(GallFile gallFile) throws Exception{
		System.out.println("insertFile");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.uploadFile(gallFile);
	}
	
	

}
