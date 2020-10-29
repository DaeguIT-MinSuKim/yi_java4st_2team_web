package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.Brand;
import rentcar.dto.Brand;
import rentcar.utils.Paging;
import rentcar.dto.Brand;

public interface BrandDao {

	// 브랜드리스트 불러오기
	List<Brand> selectBrandByAll();

	// 브랜드 불러오기
	Brand selectBrandByNo(int no);

	// 브랜드 추가하기
	int insertBrand(Brand brand);

	// 브랜드 수정하기
	int updateBrand(Brand brand);

	// 브랜드 삭제하기
	int deleteBrand(Brand brand);

	// 페이징
	int countBrandByAll();

	ArrayList<Brand> pagingBrandByAll(Paging paging);

	// 관리자 차량 - 검색
	int countSearchBrandByAll(String condition, String keyword);

	ArrayList<Brand> searchBrandList(String condition, String keyword, Paging paging);
}
