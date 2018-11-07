package kr.co.codin.gallary.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public String write(Gallary gallary,MultipartFile attach) throws Exception{
		System.out.println(gallary);
		
		System.out.println("write");
		System.out.println("아이디 :"+tService.login1().getMemberId());
		System.out.println("attach : "+attach);
		
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
	
//	@RequestMapping("viewCnt.do")
//	@ResponseBody
//	public String viewCnt(int gallNo) throws Exception{
//		System.out.println("viewCntController");
//		System.out.println("아이디 :"+tService.login1().getMemberId());
//		service.updateViewCnt(gallNo);
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"detail.do";
//	}
	
		
	

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
	
	@RequestMapping("deleteCom.do")
	@ResponseBody
	public String deleteCom(int gallComNo) throws Exception{
		System.out.println("아이디 :"+tService.login1().getMemberId());
		service.deleteGallComment(gallComNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do"; 
	}	
	
//	MultipartFile 의 주요 메소드는
//
//	 String getName()	파라미터 이름을 구한다. 
//	 String getOriginalFilename()	 업로드 한 파일의 실제!! 이름을 구한다.
//	 boolean isEmpty()	 업로드 한 파일이 존재하지 않는 경우 true를 리턴한다.
//	 long getSize()	 업로드한 파일의 크기를 구한다.
//	 byte[] getBytes() throws IOException	 업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
//	 InputStream getInputStream()	 InputStrem을 구한다.
//	 void transferTo(File dest)	 업로드 한 파일 데 이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.


	@RequestMapping("uploadFile.do")
	public String uploadFile(GallFile gallFile, MultipartFile mFile) throws Exception{
		System.out.println("호출");
		System.out.println(mFile);
		
		//System.out.println("insertFile");
		//System.out.println("아이디 :"+tService.login1().getMemberId());
		
		String fileOriName = mFile.getOriginalFilename();
		mFile.transferTo(new File("C:/app/upload", fileOriName));
		
		
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"write.do";		
	}
	
	

}
