package rentcar.dao;

import java.util.List;

import rentcar.dto.Opt;

public interface OptBoxDao {
	// 대여Box에 opt 추가
	int insertOptByRent(int optCode, int rentNo);

	// 대여Box에 opt 삭제
	int deleteOptByRent(int rentNo);

	// 대여Box에 opt 불러오기
	List<String> selectOptByRent(int rentNo);
}
