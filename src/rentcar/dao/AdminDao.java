package rentcar.dao;

import rentcar.dto.Admin;

public interface AdminDao {
	
	// 어드민 아이디
	Admin selectAdminById(String id);

}
