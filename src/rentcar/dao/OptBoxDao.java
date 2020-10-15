package rentcar.dao;

import java.util.List;

import rentcar.dto.Opt;

public interface OptBoxDao {
	//회원Box에 opt 불러오기
	List<Opt> selectOptByAll();
	//회원Box에 opt 추가
	int insertOptInBox();
	//회원Box에 opt 삭제
	int deleteOptInBox();
}
