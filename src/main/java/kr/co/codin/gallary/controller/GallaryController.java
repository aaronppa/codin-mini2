package kr.co.codin.gallary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("gallary")
public class GallaryController {

	
	@RequestMapping("list.do")
	public void list(Model model) throws Exception{
		model.addAttribute("gall");
	}
	@RequestMapping("detail.do")
	public void detail() throws Exception{
		System.out.println("detail");
	}
	@RequestMapping("updateForm.do")
	public void updateForm() throws Exception{
		System.out.println("updateForm");
	}
	@RequestMapping("writeForm.do")
	public void writeForm() throws Exception{
		System.out.println("writeForm");
	}

}
