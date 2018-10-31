package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Gallary;

public interface GallaryMapper {
	List<Gallary> selectGall();
	Gallary selectGallByNo(int no);
}
