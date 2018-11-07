package kr.co.codin.gallary.service;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
//	public Integer updateViewCnt(int gallNo) {
//		return mapper.updateViewCnt(gallNo);
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
		mapper.updateViewCnt(gallNo);
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
	public void deleteGallComment(int gallComNo) {
		mapper.deleteGallComment(gallComNo);
	}



	@Override
	public void uploadFile(GallFile gallFile) {
		System.out.println("FileNo"+gallFile.getFileNo());
		
		mapper.uploadFile(gallFile);
	}	

	
	

		

	

	

	
	
	
}
