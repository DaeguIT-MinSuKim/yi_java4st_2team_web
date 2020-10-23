package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;

import rentcar.dao.impl.RentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.dto.Rent;

public class RentService {
	private RentDaoImpl dao = RentDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public RentService() {
		dao.setCon(con);
	}

	public Rent selectRentByDate(String id){
		return dao.selectRentByDate(id);
	}
}