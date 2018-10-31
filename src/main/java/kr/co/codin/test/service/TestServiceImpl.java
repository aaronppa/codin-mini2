package kr.co.codin.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.mapper.TestMapper;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestMapper mapper;
	
	@Override
	public Member login1() {
		return mapper.selectMember1(1);
	}

	@Override
	public Member login2() {
		return mapper.selectMember1(2);
	}

	@Override
	public Member login3() {
		return mapper.selectMember1(3);
	}

	@Override
	public Member login4() {
		return mapper.selectMember1(4);
	}

}
