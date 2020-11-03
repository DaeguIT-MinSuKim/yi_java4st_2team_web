package rentcar.service;

import java.sql.Connection;

import rentcar.dao.AdminDao;
import rentcar.dao.impl.AdminDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Admin;

public class AdminService {

	private static Connection con;
	private AdminDao dao;

	public AdminService() {
		con = JndiDS.getConnection();
		dao = AdminDaoImpl.getInstance();
		((AdminDaoImpl) dao).setCon(con);
	}

	public Admin selectAdminById(String id) {
		return dao.selectAdminById(id);
	}
	// 차량 관리하기 트랜잭션
	// 1.차량리스트 불러오기
	// 2.차량정보 불러오기
	// 3.차량정보 수정하기
	// 4.차량정보 삭제하기?

	// 렌트 예약보기 트랜잭션
	// 1.예약리스트 불러오기
	// 2.예약정보 불러오기

	// 대여 내역보기 트랜잭션
	// 1.대여내역보기
	// 2.대여정보 불러오기
	// 3.대여정보 수정하기

	// 고객 관리하기 트랜잭션
	// 1.고객리스트 불러오기
	// 2.고객정보 불러오기
	// 3.고객번호에 맞는 대여내역 리스트로 불러오기
	// 4.블랙리스트 목록 받아오기

	// 견적요청 명단
	// 1.견적요청 리스트 불러오기
	// 2.견적요청 정보 불러오기
	// 3.견적요청 정보 삭제하기
}
