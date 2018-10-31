package kr.co.codin.msg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codin.msg.service.MsgService;
import kr.co.codin.repository.mapper.MsgMapper;

@Controller
@RequestMapping("msg")
public class MsgController {
	
	@Autowired
	private MsgService service;
	
	@Autowired
	MsgMapper mapper;

	@RequestMapping("maininbox.do")
	public void test1() {
		
	}
}
