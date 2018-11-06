package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.GallComment;
import kr.co.codin.repository.domain.GallFile;
import kr.co.codin.repository.domain.Gallary;

public interface GallaryMapper {
	List<Gallary> selectGall();
	Gallary selectGallByNo(int gallNo);
	void insertGall(Gallary gallary);
	void updateGall(Gallary gallary);
	void deleteGall(int gallNo);
	//조회수
//	Integer updateViewCnt(int gallNo);
	//댓글
	void insertGallComment(GallComment gallComment);
	List<GallComment> selectCommentList(int gallNo);
	
	//파일
	void uploadFile(GallFile gallFile);
}
