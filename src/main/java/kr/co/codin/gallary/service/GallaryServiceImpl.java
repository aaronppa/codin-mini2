package kr.co.codin.gallary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.repository.domain.GallComment;
import kr.co.codin.repository.domain.GallFile;
import kr.co.codin.repository.domain.Gallary;
import kr.co.codin.repository.mapper.GallaryMapper;

@Service
public class GallaryServiceImpl implements GallaryService{

	@Autowired
	private GallaryMapper mapper;

	@Override
	public List<Gallary> gallList() {
		return mapper.selectGall();
	}

	
	
//	@Override
//	public Integer updateViewCnt(Integer gallViewCnt) {
//		mapper.updateViewCnt(gallViewCnt);
//	
//	}



	@Override
	public void writeGall(Gallary gallary) {
		mapper.insertGall(gallary);
	}

	
	@Override
	public Gallary updateForm(int gallNo) {
		return mapper.selectGallByNo(gallNo);
	}

	@Override
	public void updateGall(Gallary gallary) {
		mapper.updateGall(gallary);
	}

	
	@Override
	public void deleteGall(int gallNo) {
		mapper.deleteGall(gallNo);
		
	}

	@Override
	public Gallary detailGall(int gallNo) {
		
		return mapper.selectGallByNo(gallNo);
	}

	@Override
	public void insertGallComment(GallComment gallComment) {
		 mapper.insertGallComment(gallComment);
	}




	@Override
	public List<GallComment> selectCommentList(int gallNo) {
		return mapper.selectCommentList(gallNo);
	}



	@Override
	public void uploadFile(GallFile gallFile) {
		
		mapper.uploadFile(gallFile);
	}
	
	


	
	

	
	


	
	
//	@Override
//	public void insertFile(GallFile gallFile) {
//		mapper.insertFile(gallFile);
//	}

	
	
	

		

	

	

	
	
	
}
