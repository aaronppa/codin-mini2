package kr.co.codin.gallary.service;

import java.util.List;

import kr.co.codin.repository.domain.Gallary;

public interface GallaryService {
	
	void writeGall(Gallary gallary);
	
	void updateGall(int gallNo);

	void deleteGall(int gallNo);
	
	List<Gallary> gallList(Gallary gallary);
	
	Gallary detailGall(int gallNo);
	
	
	
}
