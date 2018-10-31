package kr.co.codin.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codin.ticket.service.TicketService;

@Controller
@RequestMapping("ticket")
public class TicketController {

	@Autowired
	private TicketService service;
	
	
}
