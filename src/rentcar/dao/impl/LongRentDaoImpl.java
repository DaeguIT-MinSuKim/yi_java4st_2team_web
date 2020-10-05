package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import rentcar.dao.LongRentDao;
import rentcar.dto.LongRent;
import rentcar.dto.Member;
import rentcar.exception.CustomSQLException;

public class LongRentDaoImpl implements LongRentDao {

	private static final LongRentDaoImpl instance = new LongRentDaoImpl();
	
	private Connection con;

	public LongRentDaoImpl() {
	}

	public static LongRentDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public ArrayList<LongRent> listLongRent(String id) {
		String sql = "SELECT NO, title, CONTENTS, EXTERIOR, SAFETY , MULTI , SHEET, FARE , id, NON_TEL , REP_YN , WRITE_DATE \r\n" + 
				"FROM LONGRENT WHERE ID = ? ORDER BY NO DESC";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					ArrayList<LongRent> list= new ArrayList<LongRent>();
					do {
						list.add(getLongRent(rs));
					}while(rs.next());
					return list;
				}
			}
		}catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		
		return null;
	}

	private LongRent getLongRent(ResultSet rs) throws SQLException {
//		NO, title, CONTENTS, EXTERIOR, SAFETY , MULTI , SHEET, FARE , ID, NON_TEL , REP_YN , WRITE_DATE
		int no = rs.getInt("NO");
		String title = rs.getString("title");
		String contents = rs.getString("CONTENTS");
		String exterior = rs.getString("EXTERIOR");
		String safety = rs.getString("SAFETY");
		String multi = rs.getString("MULTI");
		String sheet = rs.getString("SHEET");
		int fare = rs.getInt("FARE");
		Member id =  new Member(rs.getString("ID"));
		String nonTel = rs.getString("NON_TEL");
		int repYn = rs.getInt("REP_YN");
		Date writeDate = rs.getTimestamp("WRITE_DATE");
		
		return new LongRent(no, title, contents, exterior, safety, multi, sheet, fare, id, nonTel, repYn, writeDate);
	}

	@Override
	public LongRent getLongRent(int no) {
		
		return null;
	}

	@Override
	public int insertLongRent(LongRent longrent) {
		// TODO Auto-generated method stub
		return 0;
	}

}
