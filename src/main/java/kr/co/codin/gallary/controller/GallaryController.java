package kr.co.codin.gallary.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.fileupload.FileUpload;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	//tomcat서버경로(프로젝트명까지)를 지정
	@Autowired
	private ServletContext context;
	
	@Autowired
	private TestService tService;
	
	@Autowired
	private GallaryService service;
	
	@RequestMapping("list.do")
	public void list(Model model, GallFile gallFile) throws Exception{
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
	public String write(Gallary gallary, GallFile gallFile, MultipartFile attach) throws Exception{
		
		
		String fileOriName = attach.getOriginalFilename();
		int fileSize = (int) attach.getSize();
//		int gallNo = gallFile.getGallNo();
//		System.out.println("서버이름"+fileServerName);
//		System.out.println("GallNo : "+gallNo);
		if(attach.isEmpty() == true) 
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"writeForm.do";
		//oriName
		gallFile.setFileOriName(fileOriName);
		//serverName
//		gallFile.setFileServerName(fileServerName);
		//파일크기
		gallFile.setFileSize(fileSize);
		//파일경로
		gallFile.setFilePath(context.getRealPath("/gallimg"));
		
	
		service.writeGall(gallary);
		
		//GallaeyFileVO gallNo
		int gallNo = gallary.getGallNo();
		//Gallary의 gallNo를 gallary
		System.out.println("gallary.gallNo : "+gallNo);	
		
		String fileServerName = "server"+gallNo;
		gallFile.setFileServerName(fileServerName);
		gallFile.setGallNo(gallNo);
		service.uploadFile(gallFile);
		attach.transferTo(new File(context.getRealPath("/gallimg"),fileServerName+".jpg"));
		gallFile.setFileServerName(fileServerName);
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


//	@RequestMapping("uploadFile.do")
//	@ResponseBody
//	public String uploadFile(GallFile gallFile) throws Exception{
//		
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";		
//	}
	
	

}
