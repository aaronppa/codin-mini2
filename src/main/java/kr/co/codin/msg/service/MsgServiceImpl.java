package kr.co.codin.msg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.mapper.MsgMapper;

@Service
public class MsgServiceImpl implements MsgService{

	@Autowired
	MsgMapper mapper;
	
}
