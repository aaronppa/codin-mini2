package kr.co.codin.gallary.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.codin.repository.domain.GallComment;
import kr.co.codin.repository.domain.GallFile;
import kr.co.codin.repository.domain.Gallary;

public interface GallaryService {
	
	List<Gallary> gallList();
	

	void writeGall(Gallary gallary);
	
	Gallary updateForm(int gallNo);
	
	void updateGall(Gallary gallary);

	void deleteGall(int gallNo);
	
	Gallary detailGall(int gallNo);
	
	//조회수
//	int updateViewCnt(int gallNo);

	void insertGallComment(GallComment gallComment);

	List<GallComment> selectCommentList(int gallNo);
	
	void deleteGallComment(int gallComNo);
	
	void uploadFile(GallFile gallFile);
	
}
