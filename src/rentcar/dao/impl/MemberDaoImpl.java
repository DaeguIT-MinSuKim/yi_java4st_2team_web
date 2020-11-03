package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;

import rentcar.dao.MemberDao;
import rentcar.ds.JndiDS;
import rentcar.dto.Member;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class MemberDaoImpl implements MemberDao {

	private static final MemberDaoImpl instance = new MemberDaoImpl();
	private Connection con;

	public MemberDaoImpl() {
		super();
	}

	public static MemberDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	
	//차트용
	@Override
	public JSONArray getCountBlackList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray jsonArray = new JSONArray();
		
		JSONArray colNameArray = new JSONArray(); //컬 타이틀 설정
		colNameArray.put("블랙리스트 여부");
		colNameArray.put("인원 수");
		jsonArray.put(colNameArray);
		
		try {
			con = JndiDS.getConnection();
			sql="SELECT is_Black,count(*) " + 
					"FROM MEMBER " + 
					"GROUP BY IS_BLACK " + 
					"HAVING IS_black in('Y', 'N') ORDER BY IS_BLACK asc";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				JSONArray rowArray = new JSONArray();
				rowArray.put(rs.getString("IS_BLACK"));
				rowArray.put(rs.getInt("COUNT(*)"));
				
				jsonArray.put(rowArray);
			}//while
		}catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}
	
	@Override
	public ArrayList<Member> selectMemberByAll() {
		String sql = "SELECT * FROM MEMBER ORDER BY NAME ASC";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<Member> list = new ArrayList<Member>();
				do {
					list.add(getMemberList(rs));
				} while (rs.next());
				return list;
			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Member getMemberList(ResultSet rs) throws SQLException {
		String id = rs.getString("ID");
		String pwd = rs.getString("PWD");
		String gender = rs.getString("GENDER");
		Date birth = rs.getTimestamp("BIRTH");
		String name = rs.getString("NAME");
		String tel = rs.getString("TEL");
		String li_class = rs.getString("LI_CLASS");
		String li_number = rs.getString("LI_NUMBER");
		String email = rs.getString("EMAIL");
		String address = rs.getString("ADDRESS");
		String is_black = rs.getString("IS_BLACK");
		Integer counting = rs.getInt("COUNTING");
		Date date = rs.getTimestamp("LOGIN_DATE");
		Integer try_counting = rs.getInt("TRY_COUNTING");
		String is_lock = rs.getString("IS_LOCK");
		Integer lock_counting = rs.getInt("LOCK_COUNTING");
		String reason = rs.getString("REASON");
		String content = rs.getString("CONTENT");
		return new Member(id, pwd, gender, birth, name, tel, li_class, li_number, email, address, is_black, counting,
				date, try_counting, is_lock, lock_counting, reason, content);
	}

	@Override
	public Member selectMemberByUserId(String id) {
		String sql = "SELECT * FROM MEMBER WHERE id = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMemberList(rs);
				}

			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int insertMember(Member member) {
		String sql = "INSERT INTO MEMBER(ID, PWD, GENDER, BIRTH, NAME, TEL, LI_CLASS, LI_NUMBER, EMAIL, ADDRESS) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getGender());
			pstmt.setTimestamp(4, new Timestamp(member.getBirth().getTime()));
			pstmt.setString(5, member.getName());
			pstmt.setString(6, member.getTel());
			pstmt.setString(7, member.getLi_class());
			pstmt.setString(8, member.getLi_number());
			pstmt.setString(9, member.getEmail());
			pstmt.setString(10, member.getAddress());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int updateMember(Member member) {
		String sql = "UPDATE MEMBER\r\n"
				+ "      SET GENDER = ?,\r\n"
				+ "   		 BIRTH = ?,\r\n"
				+ "   		 LI_CLASS = ?,\r\n"
				+ "   		 LI_NUMBER = ?,\r\n"
				+ "   		 EMAIL = ?,\r\n"
				+ "   		 ADDRESS = ?\r\n"
				+ "    WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getGender());
			pstmt.setTimestamp(2, new Timestamp(member.getBirth().getTime()));
			pstmt.setString(3, member.getLi_class());
			pstmt.setString(4, member.getLi_number());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int updateBlack(Member member) {
		String sql = "UPDATE MEMBER SET IS_BLACK = ? WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getIs_black());
			pstmt.setString(2, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteMember(Member member) {
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	// 페이징 - 회원 리스트
	@Override
	public int countMemberByAll() {
		String sql = "SELECT COUNT(*) FROM MEMBER";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Member> pagingMemberByAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM MEMBER ORDER BY NAME ASC) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Member> list = new ArrayList<Member>();
					do {
						list.add(getMemberList(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public ArrayList<Member> selectMemberBlackList() {
		String sql = "SELECT * FROM MEMBER WHERE IS_BLACK = 'Y' ORDER BY NAME ASC";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<Member> list = new ArrayList<Member>();
				do {
					list.add(getMemberList(rs));
				} while (rs.next());
				return list;
			}

		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	// 페이징 - 회원 블랙 리스트
	@Override
	public int countMemberBlackList() {
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE IS_BLACK = 'Y'";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Member> pagingMemberBlackList(Paging paging) {
		String sql = "SELECT *\r\n" + "FROM (SELECT rownum RN, a.*\r\n" + "          FROM (SELECT * \r\n"
				+ "                  FROM MEMBER\r\n" + "                 WHERE IS_BLACK = 'Y'\r\n"
				+ "                 ORDER BY NAME ASC) a)\r\n" + "         WHERE RN BETWEEN ? AND ?\r\n"
				+ "         ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Member> list = new ArrayList<Member>();
					do {
						list.add(getMemberList(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public ArrayList<Member> selectSearchMember(String condition, String keyword) {
		// SELECT * FROM WHERE ID LIKE '%?%'
		// SELECT * FROM WHERE NAME LIKE '%?%'
		String sql = "SELECT * FROM MEMBER";
		try {
			if (keyword != null && !keyword.isEmpty()) {
				sql += " where " + condition.trim() + " like '%" + keyword.trim() + "%' ORDER BY NAME ASC";
			} else {
				// 모든 레코드 검색
				sql += " ORDER BY NAME ASC";
			}
			try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Member> list = new ArrayList<Member>();
					do {
						list.add(getMemberList(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (Exception e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int leaveMember(Member member) {
		String sql = "UPDATE MEMBER\r\n"
				+ "   SET PWD = ?,\r\n"
				+ "  		GENDER = ?,\r\n"
				+ "   		BIRTH = ?,\r\n"
				+ "   		NAME = ?,\r\n"
				+ "   		TEL = ?,\r\n"
				+ "   		LI_CLASS = ?,\r\n"
				+ "   		LI_NUMBER = ?,\r\n"
				+ "   		EMAIL = ?,\r\n"
				+ "   		ADDRESS = ?,\r\n"
				+ "   		REASON = ?,\r\n"
				+ "   		CONTENT = ?\r\n"
				+ "  WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getGender());
			pstmt.setTimestamp(3, new Timestamp(member.getBirth().getTime()));
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getLi_class());
			pstmt.setString(7, member.getLi_number());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getAddress());
			pstmt.setString(10, member.getReason());
			pstmt.setString(11, member.getContent());
			pstmt.setString(12, member.getId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int changePass(String id, String pwd) {
		String sql = "UPDATE MEMBER\r\n"
				+ "      SET PWD = ?\r\n"
				+ "    WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
