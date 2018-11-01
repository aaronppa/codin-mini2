package kr.co.codin.gallary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Gallary;
import kr.co.codin.repository.mapper.GallaryMapper;

@Service
public class GallaryServiceImpl implements GallaryService{

	@Autowired
	GallaryMapper mapper;

	@Override
	public void writeGall(Gallary gallary) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateGall(int gallNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGall(int gallNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Gallary> gallList(Gallary gallary) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Gallary detailGall(int gallNo) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
	
}
