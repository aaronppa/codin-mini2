package kr.co.codin.gallary.service;

import java.util.List;

import kr.co.codin.repository.domain.GallComment;
import kr.co.codin.repository.domain.GallFile;
import kr.co.codin.repository.domain.Gallary;

public interface GallaryService {
	
	List<Gallary> gallList();
	
//	Integer updateViewCnt(int gallNo);

	void writeGall(Gallary gallary);
	
	Gallary updateForm(int gallNo);
	
	void updateGall(Gallary gallary);

	void deleteGall(int gallNo);
	
	Gallary detailGall(int gallNo);
	
	void insertGallComment(GallComment gallComment);

	List<GallComment> selectCommentList(int gallNo);
	
	void uploadFile(GallFile gallFile);
	
}
